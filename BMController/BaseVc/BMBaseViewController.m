//
//  BMBaseViewController.m
//  WeexDemo
//
//  Created by XHY on 2017/1/12.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMBaseViewController.h"

#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>

#import <WeexSDK/WXSDKInstance.h>
#import <WeexSDK/WXSDKEngine.h>
#import <WeexSDK/WXUtility.h>
#import <WeexSDK/WXDebugTool.h>
#import <WeexSDK/WXSDKManager.h>
#import "UIViewController+WXDemoNaviBar.h"
#import "DemoDefine.h"
#import "CommonMacro.h"
#import "UIImage+Util.h"
#import "UIView+Util.h"

#import "BMBaseViewController+Extend.h"
#import "BMBaseViewController+Order.h"
#import "UINavigationBar+NavigationBarExtend.h"

#import "BMMediatorManager.h"
#import "BMGlobalEventManager.h"

@interface BMBaseViewController () <UIScrollViewDelegate, UIWebViewDelegate>

@property (nonatomic, strong) UIView *weexView;
@property (nonatomic, strong) WXSDKInstance *instance;  /* instance */
@property (nonatomic, strong) NSHashTable *arr4Request;  // 存放此控制器对应的所有请求，当viewDidDisappear

@property (nonatomic, strong) NSArray *refreshList;
@property (nonatomic, strong) NSArray *refreshList1;
@property (nonatomic, strong) NSArray *refresh;
@property (nonatomic) NSInteger count;

@property (nonatomic, assign) CGFloat weexHeight;
@property (nonatomic, weak) id<UIScrollViewDelegate> originalDelegate;

@property (nonatomic, assign) BMControllerState controllerState;

@end

@implementation BMBaseViewController

- (instancetype)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (NSHashTable *)arr4Request
{
    if (!_arr4Request) {
        _arr4Request = [[NSHashTable alloc] initWithOptions:NSHashTableWeakMemory capacity:0];
    }
    return _arr4Request;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /* 设置一些页面属性 */
    [self setupViews];
    
    /* 监听页面刷新事件 */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationRefreshInstance:) name:@"RefreshInstance" object:nil];
    
    /* 加载weex页面 */
    [self render];
}

- (void)setupViews
{
    /* 标示页面首次打开 */
    self.controllerState = BMControllerStateOpen;
    
    /* 设置0 0点坐标从导航栏下开始 */
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    /* 设置背景颜色 */
    [self.view setBackgroundColor:K_BACKGROUND_COLOR];
    
    // 设置backBarItem 不要文字
    UIBarButtonItem *_barBtnItem = [[UIBarButtonItem alloc] init];
    _barBtnItem.title = @"";
    self.navigationItem.backBarButtonItem = _barBtnItem;
    
    /* 设置导航栏shadowImage */
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];

    /* 设置weex页面高度 */
    _weexHeight = [self weexViewHeight];
    
    /* 设置title */
    self.navigationItem.title = self.routerModel.navigationInfo.title ? self.routerModel.navigationInfo.title : @"";
    
    /* 判断是否需要隐藏导航栏 并设置weex页面高度
       注：使用FDFullscreenPopGesture方法设置，自定义pop返回动画
     */
    if ([self isHideNavbar]) {
        self.fd_prefersNavigationBarHidden = YES;
    } else {
        self.fd_prefersNavigationBarHidden = NO;
        _weexHeight -= K_NAVBAR_HEIGHT;
    }
    
    /* 是否禁用手势返回 */
    if (self.routerModel.forbidBack) {
        self.fd_interactivePopDisabled = YES;
    }

    /* 添加BackItem */
    [self addBackBarbuttonItem];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    /* 设置状态栏样式 */
    [self bmSetStatusBarStyle];

    /* 保存当前栈顶的 WXSDKInstance 与 ViewController */
    [[BMMediatorManager shareInstance] setCurrentWXInstance:self.instance];
    [[BMMediatorManager shareInstance] setCurrentViewController:self];
    
    // 通知js页面生命周期
    if (self.controllerState != BMControllerStateOpen) [BMGlobalEventManager sendViewLifeCycleEventWithInstance:_instance event:BMViewWillAppear controllerState:self.controllerState];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 通知js页面生命周期
    if (self.controllerState != BMControllerStateOpen) [BMGlobalEventManager sendViewLifeCycleEventWithInstance:_instance event:BMViewDidAppear controllerState:self.controllerState];
    [self updateInstanceState:WeexInstanceAppear];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self cancelAllRequest];
    
    [BMGlobalEventManager sendViewLifeCycleEventWithInstance:_instance event:BMViewWillDisappear controllerState:self.controllerState];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [BMGlobalEventManager sendViewLifeCycleEventWithInstance:_instance event:BMViewDidDisappear controllerState:self.controllerState];
    self.controllerState = BMControllerStateBack;
    
    [self updateInstanceState:WeexInstanceDisappear];
}

/* cancel掉所有请求 */
- (void)cancelAllRequest
{
    for (BMCommonRequest *request in self.arr4Request) {
        if (request) [request stop];
    }
    
    [self.arr4Request removeAllObjects];
    self.arr4Request = nil;
}

//TODO get height
- (void)viewDidLayoutSubviews
{
    _weexHeight = self.view.frame.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    WXLogInfo(@"dealloc >>>>>>>>>>>>>>>>>>>>>> %@",self.navigationItem.title);
    
    [_instance destroyInstance];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)render
{
    CGFloat width = self.view.frame.size.width;
    
    // 临时保存之前instance的引用 当新的instance渲染完毕后在将其destroy掉 避免能看到页面的跳动
//    WXSDKInstance *tempInstance = _instance;
//    [_instance destroyInstance];
    
    WXSDKInstance *tempInstance = [[WXSDKInstance alloc] init];
    if ([WXPrerenderManager isTaskExist:[self.url absoluteString]]) {
        tempInstance = [WXPrerenderManager instanceFromUrl:self.url.absoluteString];
    }
    __weak typeof (WXSDKInstance *)weakTempInstance = tempInstance;
    
    tempInstance.viewController = self;
    tempInstance.frame = CGRectMake(0.0, 0.0, width, _weexHeight);
    
    __weak typeof(self) weakSelf = self;
    tempInstance.onCreate = ^(UIView *view) {
        
    };
    tempInstance.onFailed = ^(NSError *error) {
#ifdef UITEST
        if ([[error domain] isEqualToString:@"1"]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableString *errMsg=[NSMutableString new];
                [errMsg appendFormat:@"ErrorType:%@\n",[error domain]];
                [errMsg appendFormat:@"ErrorCode:%ld\n",(long)[error code]];
                [errMsg appendFormat:@"ErrorInfo:%@\n", [error userInfo]];
                
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"render failed" message:errMsg delegate:weakSelf cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
                [alertView show];
            });
        }
#endif
    };
    
    tempInstance.renderFinish = ^(UIView *view) {
        WXLogDebug(@"%@", @"Render Finish...");
        
        // 临时保存之前的weexVeiw
        UIView *removeView = weakSelf.weexView;
        
        weakSelf.weexView = view;
        weakSelf.weexView.backgroundColor = K_BACKGROUND_COLOR;
        [weakSelf.view addSubview:weakSelf.weexView];
        
        
        // 将之前的页面remove掉
        [removeView removeFromSuperview];
       
        // 将之前的instance destroy掉
        [weakSelf.instance destroyInstance];
        
        /* 将临时变量instance赋值给成员变量 */
        weakSelf.instance = weakTempInstance;
        
        /* 在中介者中保留 instance 的引用 */
        [[BMMediatorManager shareInstance] setCurrentWXInstance:weakSelf.instance];
        
        UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, weakSelf.weexView);
        
        [weakSelf updateInstanceState:WeexInstanceAppear];
        
        // 通知 js 页面生命周期方法
        [BMGlobalEventManager sendViewLifeCycleEventWithInstance:weakSelf.instance event:BMViewWillAppear controllerState:weakSelf.controllerState];
        [BMGlobalEventManager sendViewLifeCycleEventWithInstance:weakSelf.instance event:BMViewDidAppear controllerState:weakSelf.controllerState];
    };
    
    tempInstance.updateFinish = ^(UIView *view) {
        WXLogDebug(@"%@", @"Update Finish...");
    };
    if (!self.url) {
        WXLogError(@"error: render url is nil");
        return;
    }
    if([WXPrerenderManager isTaskExist:[self.url absoluteString]]){
        WX_MONITOR_INSTANCE_PERF_START(WXPTJSDownload, _instance);
        WX_MONITOR_INSTANCE_PERF_END(WXPTJSDownload, _instance);
        WX_MONITOR_INSTANCE_PERF_START(WXPTFirstScreenRender, _instance);
        WX_MONITOR_INSTANCE_PERF_START(WXPTAllRender, _instance);
        [WXPrerenderManager renderFromCache:[self.url absoluteString]];
        return;
    }
    NSURL *URL = [self testURL: [self.url absoluteString]];
    NSString *randomURL = [NSString stringWithFormat:@"%@%@random=%d",URL.absoluteString,URL.query?@"&":@"?",arc4random()];
    [tempInstance renderWithURL:[NSURL URLWithString:randomURL] options:@{@"bundleUrl":URL.absoluteString} data:nil];
}

- (void)updateInstanceState:(WXState)state
{
    if (_instance && _instance.state != state) {
        _instance.state = state;
        
        if (state == WeexInstanceAppear) {
            [[WXSDKManager bridgeMgr] fireEvent:_instance.instanceId ref:WX_SDK_ROOT_REF type:@"viewappear" params:nil domChanges:nil];
        }
        else if (state == WeexInstanceDisappear) {
            [[WXSDKManager bridgeMgr] fireEvent:_instance.instanceId ref:WX_SDK_ROOT_REF type:@"viewdisappear" params:nil domChanges:nil];
        }
    }
}

#pragma mark - UIBarButtonItems

#pragma mark - websocket
- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    if ([@"refresh" isEqualToString:message]) {
        [self render];
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error
{
    
}

#pragma mark - localBundle
/*- (void)loadLocalBundle:(NSURL *)url
 {
 NSURL * localPath = nil;
 NSMutableArray * pathComponents = nil;
 if (self.url) {
 pathComponents =[NSMutableArray arrayWithArray:[url.absoluteString pathComponents]];
 [pathComponents removeObjectsInRange:NSRangeFromString(@"0 3")];
 [pathComponents replaceObjectAtIndex:0 withObject:@"bundlejs"];
 
 NSString *filePath = [NSString stringWithFormat:@"%@/%@",[NSBundle mainBundle].bundlePath,[pathComponents componentsJoinedByString:@"/"]];
 localPath = [NSURL fileURLWithPath:filePath];
 }else {
 NSString *filePath = [NSString stringWithFormat:@"%@/bundlejs/index.js",[NSBundle mainBundle].bundlePath];
 localPath = [NSURL fileURLWithPath:filePath];
 }
 
 NSString *bundleUrl = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/bundlejs/",[NSBundle mainBundle].bundlePath]].absoluteString;
 [_instance renderWithURL:localPath options:@{@"bundleUrl":bundleUrl} data:nil];
 }*/

#pragma mark - load local device bundle
- (NSURL*)testURL:(NSString*)url
{
    NSRange range = [url rangeOfString:@"_wx_tpl"];
    if (range.location != NSNotFound) {
        NSString *tmp = [url substringFromIndex:range.location];
        NSUInteger start = [tmp rangeOfString:@"="].location;
        NSUInteger end = [tmp rangeOfString:@"&"].location;
        ++start;
        if (end == NSNotFound) {
            end = [tmp length] - start;
        }
        else {
            end = end - start;
        }
        NSRange subRange;
        subRange.location = start;
        subRange.length = end;
        url = [tmp substringWithRange:subRange];
    }
    return [NSURL URLWithString:url];
}

#pragma mark - notification
- (void)notificationRefreshInstance:(NSNotification *)notification {
    [self refreshWeex];
}

#pragma mark - refresh
- (void)refreshWeex
{
    /* 标示页面状态刷新 */
    self.controllerState = BMControllerStateRefresh;
    
    [self render];
}

- (void)addRequest:(BMCommonRequest *)request
{
    [self.arr4Request addObject:request];
}

@end
