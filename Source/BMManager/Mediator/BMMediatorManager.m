//
//  BMMediatorManager.m
//  WeexDemo
//
//  Created by XHY on 2017/2/3.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMMediatorManager.h"

#import "BMDefine.h"

#import "BMNavigationController.h"
#import "BMBaseViewController.h"
#import "BMTabBarController.h"
#import "BMWebViewController.h"
#import "BMResourceManager.h"
#import "BMConfigManager.h"

#import "HYGuideView.h"

#import "BMUserInfoModel.h"
#import "BMDB.h"

@interface BMMediatorManager ()

@property (nonatomic, strong) BMRouterModel *openVcRouterModel;    // 跳转页面时的routerModel
@property (nonatomic, weak) WXSDKInstance *openVcWeexInstance;     // 跳转页面前的weexInstance

@property (nonatomic, strong) BMBaseViewController *jsMediator;        // 此页面作为js端的中介者，常驻内存

@property (nonatomic, weak) UIViewController *loginViewController;  // 登录vc

@property (nonatomic, assign) BOOL needToNextVc;    // 标记登录成功后是否需要自动跳转到下一个页面

@property (nonatomic, copy) WXModuleCallback loginAfterCallback;    // 登录成功后的回调方法

@end

@implementation BMMediatorManager

+ (instancetype)shareInstance
{
    static BMMediatorManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[BMMediatorManager alloc] init];
    });
    
    return _instance;
}

#pragma mark - Setter / Getter

#pragma mark - Private Method

- (BMRouterModel *)_routerModelWithURLPath:(NSString *)url navTitle:(NSString *)navTitle params:(NSDictionary *)params animateType:(NSString *)animateType navBarShow:(BOOL)navBarShow
{
    BMRouterModel *routerModel = [[BMRouterModel alloc] init];
    routerModel.url = url;
    routerModel.params = params;
    routerModel.type = animateType;
    routerModel.navShow = navBarShow;
    routerModel.navTitle = navTitle;

    return routerModel;
}

- (void)_openViewControllerWithRouterModel:(BMRouterModel *)routerModel weexInstance:(WXSDKInstance *)weexInstance
{
    /* 初始化控制器 */
    BMBaseViewController *controller = [[BMBaseViewController alloc] init];
    controller.url = [BMAppResource configJSFullURLWithPath:routerModel.url];
    controller.routerModel = routerModel;
    controller.hidesBottomBarWhenPushed = YES;
    
    if (routerModel.isNeedRootVC) {
        routerModel.type = K_ANIMATE_PRESENT;
        [UIApplication.sharedApplication.keyWindow.rootViewController presentViewController:controller animated:YES completion:nil];
        return ;
    }
    
    if (weexInstance == self.jsMediator.instance) {
        weexInstance = self.currentWXInstance;
    }
    
    /* 页面展现方式 */
    if (!routerModel.type || [routerModel.type isEqualToString:K_ANIMATE_PUSH])
    {
        [self pushViewController:controller weexInstance:weexInstance];
    }
    else if ([routerModel.type isEqualToString:K_ANIMATE_PRESENT])
    {
        BMNavigationController *navc = [[BMNavigationController alloc] initWithRootViewController:controller];
        if (@available(iOS 13.0, *)) {
            navc.modalPresentationStyle = UIModalPresentationFullScreen;
         }
        [self presentViewController:navc weexInstance:weexInstance];
    }
    else if ([routerModel.type isEqualToString:K_ANIMATE_TRANSLATION])
    {
        BMNavigationController *navc = [[BMNavigationController alloc] initWithRootViewController:controller];
//        controller.transitioningDelegate = controller;
//        self.currentViewController.transitioningDelegate = self.currentViewController;
        navc.transitioningDelegate = controller;
        [self presentViewController:navc weexInstance:weexInstance];
    }
    else {
        WXLogError(@" 【JS ERROR】 animateType 拼写错误：%@",routerModel.type);
    }
}

- (void)pushViewController:(UIViewController *)vc weexInstance:(WXSDKInstance *)weexInstance
{
    UIViewController *currentVc = weexInstance.viewController ? weexInstance.viewController : self.currentViewController;
    [[currentVc navigationController] pushViewController:vc animated:YES];
}

- (void)presentViewController:(UIViewController *)vc weexInstance:(WXSDKInstance *)weexInstance
{
    UIViewController *currentVc = weexInstance.viewController ? weexInstance.viewController : self.currentViewController;
    [currentVc presentViewController:vc animated:YES completion:nil];
}


/**
 加载一个常驻内存的WeexInstance作为js端的中介者

 @param reload 是否重新加载 当reload为 ture 时，强制重新加载一个新的
 */
- (void)loadJSMediator:(BOOL)reload
{
    if (!reload && self.jsMediator.instance.rootView) {
        return;
    }
    
    if (self.jsMediator) {
        self.jsMediator = nil;
    }
    BMBaseViewController *jsMediatorVc = [[BMBaseViewController alloc] init];
    jsMediatorVc.url = [BMAppResource configJSFullURLWithPath:[BMConfigManager shareInstance].platform.page.mediatorPage?:K_JS_MEDIATOR_PATH];
    [jsMediatorVc view];
    
    self.jsMediator = jsMediatorVc;
}
#pragma mark - Api Request

#pragma mark - Public Method

- (UIViewController *)loadHomeViewController
{
    /* 显示状态栏 */
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    BMPlatformModel *platformInfo = [BMConfigManager shareInstance].platform;
    platformInfo.page.homePage = BM_GetUserDefaultData(K_HomePagePath)?:platformInfo.page.homePage;
    
    /* 加载js端的中介者 */
    [self loadJSMediator:YES];
    
    if (BM_GetUserDefaultData(K_BMTabbarInfo)) {
        BMPlatformModelTabBar *tabbar = [BMPlatformModelTabBar yy_modelWithJSON:BM_GetUserDefaultData(K_BMTabbarInfo)];
        platformInfo.tabBar = tabbar;
    }
    
    /* 加载tabBar */
    if ([platformInfo.page.homePage isEqualToString:@"tabBar"]) {
        
        BMTabBarController *tabBarController = [[BMTabBarController alloc] init];
        tabBarController.tabBarInfo = platformInfo.tabBar;
        self.baseTabBarController = tabBarController;
        
        NSMutableArray *controllers = [NSMutableArray array];
        for (BMTabBarItem *item in platformInfo.tabBar.list) {
            BMBaseViewController *viewController = [[BMBaseViewController alloc] init];
            BMRouterModel *routerInfo = [[BMRouterModel alloc] init];
            routerInfo.url = item.pagePath;
            routerInfo.navShow = item.navShow;
            routerInfo.navTitle = item.navTitle;
            routerInfo.canBack = NO;
            routerInfo.isTabBarItem = YES;
            viewController.routerModel = routerInfo;
            viewController.url = [BMAppResource configJSFullURLWithPath:item.pagePath];
            BMNavigationController *navc = [[BMNavigationController alloc] initWithRootViewController:viewController];
            [controllers addObject:navc];
            // 触发控制器生命周期
            [viewController view];
        }
        
        tabBarController.viewControllers = controllers;
        return tabBarController;
    }

    BMBaseViewController *firstVc = [[BMBaseViewController alloc] init];
    firstVc.url = [BMAppResource configJSFullURLWithPath:platformInfo.page.homePage];
    BMNavigationController *firstNavc = [[BMNavigationController alloc] initWithRootViewController:firstVc];
    
    return firstNavc;

    /* 引导页面 */
//    [HYGuideView showInView:_window];

}

- (void)openViewControllerWithRouterModel:(BMRouterModel *)routerModel weexInstance:(WXSDKInstance *)weexInstance
{
    if (!routerModel.url || !routerModel.url.length) {
        
        WXLogError(@"Error： url 为空");
        
        return;
    }
    
    [self _openViewControllerWithRouterModel:routerModel weexInstance:weexInstance];
}

- (void)backVcWithRouterModel:(BMRouterModel *)routerModel weexInstance:(WXSDKInstance *)weexInstance
{
    if ([weexInstance.viewController  isKindOfClass:[BMBaseViewController class]]) {
        BMBaseViewController *vc = (BMBaseViewController *)weexInstance.viewController;
        
        if (vc.routerModel.isNeedRootVC) {
            [vc dismissViewControllerAnimated:YES completion:nil];
            return ;
        }
    }
    
    if ([routerModel.type isEqualToString:K_ANIMATE_PRESENT] ||
        [routerModel.type isEqualToString:K_ANIMATE_TRANSLATION]) {
        [weexInstance.viewController dismissViewControllerAnimated:YES completion:nil];
    } else {
        if (routerModel.vLength == 1) {
            [weexInstance.viewController.navigationController popViewControllerAnimated:YES];
            return;
        }
        
        UINavigationController *nav = weexInstance.viewController.navigationController;
        if (nav.viewControllers.count - 1 <= routerModel.vLength) {
            [weexInstance.viewController.navigationController popToRootViewControllerAnimated:YES];
            return;
        }
        
        UIViewController *disVc = [nav.viewControllers objectAtIndex:nav.viewControllers.count - 1 - routerModel.vLength];
        if (disVc) [weexInstance.viewController.navigationController popToViewController:disVc animated:YES];
    }
    
}

- (void)backToHomeIndex:(NSUInteger)index
{
    if (!self.baseTabBarController) {
        return;
    }
    
    NSArray *arr4Controller = [self.baseTabBarController viewControllers];
    
    for (UINavigationController *nav in arr4Controller) {
        
        [nav dismissViewControllerAnimated:YES completion:nil];
        [nav popToRootViewControllerAnimated:YES];
        
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.baseTabBarController) {
            
            if (index >= self.baseTabBarController.viewControllers.count ) {
                WXLogError(@"返回首页idnex参数错误：index = %lu",(unsigned long)index);
                return;
            }
            
            self.baseTabBarController.selectedIndex = index;
        }
    });
}

- (void)toWebViewWithRouterInfo:(BMWebViewRouterModel *)routerInfo
{
    BMWebViewController *webView = [[BMWebViewController alloc] initWithRouterModel:routerInfo];
    webView.hidesBottomBarWhenPushed = YES;
    [self.currentViewController.navigationController pushViewController:webView animated:YES];
}

- (void)clearRouterInfo
{
    self.openVcRouterModel = nil;
    self.openVcWeexInstance = nil;
}

/** js资源更新完毕提示 */
- (void)showJsResourceUpdatedAlert
{

    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"更新提示" message:@"更新数据已准备就绪，完成更新获得完整功能体验。" preferredStyle:UIAlertControllerStyleAlert];
        
//        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"稍后升级" style:UIAlertActionStyleDefault handler:nil];
        
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"立即更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            [[BMResourceManager sharedInstance] compareVersion];
            [[NSNotificationCenter defaultCenter] postNotificationName:K_BMAppReStartNotification object:nil];
        }];
        
//        [alertVc addAction:cancelAction];
        [alertVc addAction:confirmAction];
        
        [self.currentViewController presentViewController:alertVc animated:YES completion:nil];
    });
    
}

@end
