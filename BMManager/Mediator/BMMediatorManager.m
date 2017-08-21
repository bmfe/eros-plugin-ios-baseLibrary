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

@property (nonatomic, strong) UIViewController *jsMediator;        // 此页面作为js端的中介者，常驻内存

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

- (BMRouterModel *)_routerModelWithURLPath:(NSString *)url navTitle:(NSString *)navTitle params:(NSDictionary *)params animateType:(NSString *)animateType hideNavbar:(BOOL)hideNavbar
{
    BMRouterModel *routerModel = [[BMRouterModel alloc] init];
    NavigationInfo *navInfo = [[NavigationInfo alloc] init];
    
    routerModel.navigationInfo = navInfo;
    routerModel.url = url;
    routerModel.params = params;
    routerModel.animateType = animateType;
    
    navInfo.hideNavbar = hideNavbar;
    navInfo.title = navTitle;
    
    return routerModel;
}

- (void)_openViewControllerWithRouterModel:(BMRouterModel *)routerModel weexInstance:(WXSDKInstance *)weexInstance
{
    /* 初始化控制器 */
    BMBaseViewController *controller = [[BMBaseViewController alloc] init];
    controller.url = [BMAppResource configJSFullURLWithPath:routerModel.url];
    controller.routerModel = routerModel;
    controller.hidesBottomBarWhenPushed = YES;
    
    /* 页面展现方式 */
    if (!routerModel.animateType || [routerModel.animateType isEqualToString:K_ANIMATE_PUSH])
    {
        [self pushViewController:controller weexInstance:weexInstance];
    }
    else if ([routerModel.animateType isEqualToString:K_ANIMATE_PRESENT])
    {
        BMNavigationController *navc = [[BMNavigationController alloc] initWithRootViewController:controller];
        [self presentViewController:navc weexInstance:weexInstance];
    }
    else if ([routerModel.animateType isEqualToString:K_ANIMATE_TRANSLATION])
    {
        BMNavigationController *navc = [[BMNavigationController alloc] initWithRootViewController:controller];
//        controller.transitioningDelegate = controller;
//        self.currentViewController.transitioningDelegate = self.currentViewController;
        navc.transitioningDelegate = controller;
        [self presentViewController:navc weexInstance:weexInstance];
    }
    else {
        WXLogError(@" 【JS ERROR】 animateType 拼写错误：%@",routerModel.animateType);
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

/* 加载一个js页面常驻内存 */
- (void)loadJSMediator:(NSString *)path
{
    BMBaseViewController *jsMediatorVc = [[BMBaseViewController alloc] init];
    jsMediatorVc.url = [BMAppResource configJSFullURLWithPath:path?:K_JS_MEDIATOR_PATH];
    [jsMediatorVc view];
    
    self.jsMediator = jsMediatorVc;
}

#pragma mark - Api Request

#pragma mark - Public Method

- (void)loadViewControllerWithWindow:(UIWindow *)_window
{
    /* 显示状态栏 */
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    
    BMPlatformModel *platformInfo = [BMConfigManager shareInstance].platform;
    
    /* 加载一个页面常驻内存作为js端的中介者 */
    [self loadJSMediator:platformInfo.page.mediatorPage];

    
    BMBaseViewController *firstVc = [[BMBaseViewController alloc] init];
    firstVc.url = [BMAppResource configJSFullURLWithPath:platformInfo.page.homePage];
    BMNavigationController *firstNavc = [[BMNavigationController alloc] initWithRootViewController:firstVc];
    
    _window.rootViewController = firstNavc;
    [_window makeKeyAndVisible];
    
    /* 引导页面 */
//    [HYGuideView showInView:_window];
    
    /** 不显示网络请求标志 */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    });
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
    if ([routerModel.animateType isEqualToString:K_ANIMATE_PRESENT] ||
        [routerModel.animateType isEqualToString:K_ANIMATE_TRANSLATION]) {
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

- (void)toWebViewWithRouterInfo:(BMWebViewRouterModel *)routerInfo
{
    BMWebViewController *webView = [[BMWebViewController alloc] init];
    webView.hidesBottomBarWhenPushed = YES;
    webView.routerInfo = routerInfo;
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

    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"更新提示" message:@"更新数据已准备就绪，完成更新获得完整功能体验。" preferredStyle:UIAlertControllerStyleAlert];
    
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"稍后升级" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"立即更新" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        [[BMResourceManager sharedInstance] compareVersion];
        [[NSNotificationCenter defaultCenter] postNotificationName:K_BMAppReStartNotification object:nil];
    }];
    
//    [alertVc addAction:cancelAction];
    [alertVc addAction:confirmAction];
    
    [self.currentViewController presentViewController:alertVc animated:YES completion:nil];
}

@end
