//
//  BMDragButton+Debug.m
//  BM-JYT
//
//  Created by 窦静轩 on 2017/3/10.
//  Copyright © 2017年 XHY. All rights reserved.
//

#ifdef DEBUG
#import "BMDragButton+Debug.h"
#import "DebugSettingVC.h"
#import "BMBaseViewController.h"
#import "WXScannerVC.h"
#import "BMMediatorManager.h"
#import <UIKit/UIKit.h>
#import "BMResourceManager.h"
#import "Masonry.h"

@interface BMDragButton()<UIActionSheetDelegate>

@end


@implementation BMDragButton(Debug)

- (void)dealloc
{
    self.controller = nil;
}

+ (instancetype)debugButton
{
    CGRect rect  = [UIScreen mainScreen].bounds;
    
    CGRect frame = CGRectMake(10, CGRectGetHeight(rect) - 140, 80, 60);
    
    BMDragButton *btn = [[BMDragButton alloc] initWithFrame:frame];
    btn.backgroundColor = [UIColor blackColor];
    btn.alpha = 0.6;
    UILabel *lbl = [[UILabel alloc] init];
    lbl.textColor = K_WHITE_COLOR;
    lbl.text = @"调试";
    lbl.font = K_FONT_14;
    btn.layer.cornerRadius = 8;
    [btn addSubview:lbl];
    
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(btn);
    }];
    
    [btn setDragEnable:YES];
    [btn setAdsorbEnable:YES];
    
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:btn action:@selector(showDebug)];
    [btn addGestureRecognizer:oneTap];
    
    UITapGestureRecognizer *twoTap = [[UITapGestureRecognizer alloc] initWithTarget:btn action:@selector(refreshWeex)];
    twoTap.numberOfTapsRequired = 2;
    twoTap.numberOfTouchesRequired = 1;
    [btn addGestureRecognizer:twoTap];
    
    [oneTap requireGestureRecognizerToFail:twoTap];
    
    return btn;
}

- (void)showDebug
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"设置项",@"刷新",@"扫一扫",
                                  nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    
    
    UIViewController* topVC =  [[BMMediatorManager shareInstance] currentViewController];
    [actionSheet showInView:topVC.view];
    
}

- (void)refreshWeex
{
    /** 刷新widgetJs */
    [BMResourceManager sharedInstance].bmWidgetJs = nil;
    
    UIViewController* controller =  [[BMMediatorManager shareInstance] currentViewController];
    
    if ([controller isKindOfClass:[BMBaseViewController class]]) {
        [(BMBaseViewController*)controller refreshWeex];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:[[DebugSettingVC alloc] init]];
            
            UIViewController* controller =  [[BMMediatorManager shareInstance] currentViewController];
            
            
            [controller presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 1:
        {
            [self refreshWeex];
        }
            break;

        case 2:
        {
            #if TARGET_IPHONE_SIMULATOR//模拟器
                UIAlertView * av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"仅支持真机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
                [av show];
            #elif TARGET_OS_IPHONE//真机
                UIViewController* controller =  [[BMMediatorManager shareInstance] currentViewController];
            
                if ([controller isKindOfClass:[BMBaseViewController class]]) {
                    WXScannerVC * scanViewController = [[WXScannerVC alloc] init];
                    [controller.navigationController pushViewController:scanViewController animated:YES];
                }

            #endif
            
     }
            break;

            
        default:
            break;
    }
}
@end
#endif
