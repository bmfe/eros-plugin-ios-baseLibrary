//
//  BMTabBarController.m
//  WeexDemo
//
//  Created by XHY on 2017/1/12.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMTabBarController.h"
#import "WXHandlerFactory.h"
#import "BMMediatorManager.h"
#import "UITabBar+Badge.h"

@interface BMTabBarController () <UITabBarDelegate>

@property (nonatomic, assign) BOOL isLoadImage;

@end

@implementation BMTabBarController

- (id<WXImgLoaderProtocol>)imageLoader
{
    static id<WXImgLoaderProtocol> imageLoader;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        imageLoader = [WXHandlerFactory handlerForProtocol:@protocol(WXImgLoaderProtocol)];
    });
    return imageLoader;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[BMMediatorManager shareInstance] setBaseTabBarController:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 设置item图片
    if (!_isLoadImage) [self configItems];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat tabbarHeight = K_TABBAR_HEIGHT;
    
    /* 修改 tabbar 高度 */
    CGRect tabFrame = self.tabBar.frame;
    tabFrame.size.height = tabbarHeight;
    tabFrame.origin.y = self.view.frame.size.height - tabbarHeight;
    self.tabBar.frame = tabFrame;
    
    /* 修改内容高度 */
    UIView *trView = [self.view.subviews objectAtIndex:0];
    trView.frame = CGRectMake(0, 0, self.view.width, self.view.height - tabbarHeight);
    
}

- (void)configItems
{
    _isLoadImage = YES;
    
    // 设置bar背景颜色
    UIColor *backgroundColor = self.tabBarInfo.backgroundColor ? [UIColor colorWithHexString:self.tabBarInfo.backgroundColor] : UIColorFromValue(0xfafafa);
    self.tabBar.barTintColor = backgroundColor;
    self.tabBar.backgroundColor = backgroundColor;
    [self.tabBar setBackgroundImage:[UIImage imageWithColor:backgroundColor size:CGSizeMake(1, 1)]];
    
    // 设置shadow
    self.tabBar.shadowImage = [UIImage imageWithColor:K_CLEAR_COLOR size:CGSizeMake(self.tabBar.width, 0.5)];
    
    // 设置item选中之后图片文字的渲染颜色
//    self.tabBar.tintColor = UIColorFromValue(0x00b4cb);
    
    // 遍历item设置图片
    NSArray *items = [self.tabBar items];
    for (int i = 0; i < [items count]; i++) {
        UITabBarItem *item = items[i];
        BMTabBarItem *itemInfo = self.tabBarInfo.list[i];
        
        [[self imageLoader] downloadImageWithURL:itemInfo.icon imageFrame:CGRectZero userInfo:nil completed:^(UIImage *image, NSError *error, BOOL finished) {
            item.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }];
        
        [[self imageLoader] downloadImageWithURL:itemInfo.selectedIcon imageFrame:CGRectZero userInfo:nil completed:^(UIImage *image, NSError *error, BOOL finished) {
            item.selectedImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        }];
        
        item.title = itemInfo.text;
    }
    
    /* line */
    UIView *topLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDTH, 0.5)];
    topLine.backgroundColor = [UIColor colorWithHexString:self.tabBarInfo.borderColor? self.tabBarInfo.borderColor: @"0xdfe1eb"];
    // 插入最底层，解决异形tabBar被遮挡的问题
    [self.tabBar insertSubview:topLine atIndex:0];
 
    [self setItemFontSize];

    // 注册改变字体的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setItemFontSize) name:K_CHANGE_FONT_SIZE_NOTIFICATION object:nil];
}

- (void)setItemFontSize
{
    NSString *fontSize = [[NSUserDefaults standardUserDefaults] objectForKey:K_FONT_SIZE_KEY];
    CGFloat currFont = 9.0;
    CGFloat titleOffsetVertical = -3;
    // 标准字体
    if (!fontSize || [fontSize isEqualToString:K_FONT_SIZE_NORM])
    {
        titleOffsetVertical = -1;
    }
    else if ([fontSize isEqualToString:K_FONT_SIZE_BIG])
    {
        currFont = 9.0 * K_FontSizeBig_Scale;
        titleOffsetVertical = -1;
    }
    else if ([fontSize isEqualToString:k_FONT_SIZE_EXTRALARGE])
    {
        currFont = 9.0 * K_FontSizeExtralarge_Scale;
        titleOffsetVertical = 0;
    }
    
    NSArray *items = [self.tabBar items];
    for (int i =0; i < [items count]; i++) {
        UITabBarItem *item = items[i];
        [item setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:currFont], NSForegroundColorAttributeName: [UIColor colorWithHexString:self.tabBarInfo.color ?: @"#777777"]} forState:UIControlStateNormal];
        [item setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:currFont], NSForegroundColorAttributeName: [UIColor colorWithHexString:self.tabBarInfo.selectedColor ?: @"#00b4cb"]} forState:UIControlStateSelected];

        // 设置字体偏移
        [item setTitlePositionAdjustment:UIOffsetMake(0, titleOffsetVertical)];
//        [item setImageInsets:UIEdgeInsetsMake(-4, 0, 4, 0)];
    }
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.tabBar showBadgeOnItenIndex:0 value:@(5)];
//    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/** tabbar index change */
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    for (int i = 0; i < self.tabBar.items.count; i++) {
        UITabBarItem *tmpItem = [self.tabBar.items objectAtIndex:i];
        if (item == tmpItem) {
            [[NSNotificationCenter defaultCenter] postNotificationName:K_BMTabbarChangeIndex object:@(i)];
            return;
        }
    }
}

- (void)dealloc
{
    WXLogInfo(@"Dealloc >>>>>>>>>>>>>>>>>>>>>>>: %@",NSStringFromClass([self class]));
    
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:K_CHANGE_FONT_SIZE_NOTIFICATION object:nil];
}

@end
