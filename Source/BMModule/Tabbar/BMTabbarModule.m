//
//  BMTabbarModule.m
//  BMBaseLibrary
//
//  Created by XHY on 2018/6/21.
//

#import "BMTabbarModule.h"
#import <WeexPluginLoader/WeexPluginLoader.h>
#import "UITabBar+Badge.h"
#import "BMMediatorManager.h"

WX_PlUGIN_EXPORT_MODULE(bmTabbar, BMTabbarModule)

@interface BMTabbarModule ()

@property (nonatomic, copy) WXModuleKeepAliveCallback watchIndexCallBack;

@end

@implementation BMTabbarModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(showBadge:))
WX_EXPORT_METHOD(@selector(hideBadge:))
WX_EXPORT_METHOD(@selector(openPage:))
WX_EXPORT_METHOD_SYNC(@selector(getIndex))
WX_EXPORT_METHOD(@selector(watchIndex:))
WX_EXPORT_METHOD(@selector(clearWatch))
WX_EXPORT_METHOD_SYNC(@selector(getInfo))
WX_EXPORT_METHOD_SYNC(@selector(setInfo:))
WX_EXPORT_METHOD(@selector(clearInfo))

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/** 设置红点，或数字标示 */
- (void)showBadge:(NSDictionary *)info
{
    int index = info[@"index"] ? [info[@"index"] intValue] : 0;
    NSString *value = info[@"value"];
    UIColor *textColor = info[@"textColor"] ? [UIColor colorWithHexString:info[@"textColor"]] : [UIColor whiteColor];
    UIColor *backgroundColor = info[@"bgColor"] ? [UIColor colorWithHexString:info[@"bgColor"]] : [UIColor redColor];
    
    [[BMMediatorManager shareInstance].baseTabBarController.tabBar showBadgeOnItenIndex:index
                                                                                  value:value
                                                                        backgroundColor:backgroundColor
                                                                              textColor:textColor];
}

/** 隐藏标示 */
- (void)hideBadge:(NSDictionary *)info
{
    int index = info[@"index"] ? [info[@"index"] intValue] : 0;
    
    [[BMMediatorManager shareInstance].baseTabBarController.tabBar hideBadgeOnItenIndex:index];
}

/** 跳转到指定下标页面 */
- (void)openPage:(NSDictionary *)info
{
    NSInteger index = info[@"index"] ? [info[@"index"] integerValue] : 0;
    [[BMMediatorManager shareInstance] backToHomeIndex:index];
}

/** 获取当前下标 */
- (NSInteger)getIndex
{
    return [BMMediatorManager shareInstance].baseTabBarController.selectedIndex;
}

/** 监听下标变化 */
- (void)watchIndex:(WXModuleKeepAliveCallback)callback
{
    self.watchIndexCallBack = callback;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabbarIndexChange:) name:K_BMTabbarChangeIndex object:nil];
}

- (void)tabbarIndexChange:(NSNotification *)not
{
    if (self.watchIndexCallBack) {
        self.watchIndexCallBack(not.object, YES);
    }
}

/** 取消监听 */
- (void)clearWatch
{
    self.watchIndexCallBack = nil;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/** 获取tababr信息 */
- (NSDictionary *)getInfo
{
    return [TK_PlatformInfo().tabBar yy_modelToJSONObject];
}

/** 设置tababr信息 */
- (void)setInfo:(NSDictionary *)info
{
    if (![info isKindOfClass:[NSDictionary class]]) {
        WXLogError(@"[BM Error] tabbar info error");
        return;
    }
    [TK_PlatformInfo().tabBar yy_modelSetWithJSON:info];
    BM_SetUserDefaultData(K_BMTabbarInfo, info);
}

/** 删除存储信息 */
- (void)clearInfo
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:K_BMTabbarInfo];
}

@end
