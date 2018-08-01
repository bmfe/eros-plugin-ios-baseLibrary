//
//  BMBundleUpdateModule.m
//  BMBaseLibrary
//
//  Created by XHY on 2018/7/17.
//

#import "BMBundleUpdateModule.h"
#import <WeexPluginLoader/WeexPluginLoader.h>
#import "BMResourceManager.h"

WX_PlUGIN_EXPORT_MODULE(bmBundleUpdate, BMBundleUpdateModule)

@interface BMBundleUpdateModule ()
@property (nonatomic, copy) WXModuleKeepAliveCallback callback;
@end

@implementation BMBundleUpdateModule

WX_EXPORT_METHOD(@selector(download::))
WX_EXPORT_METHOD(@selector(update))
WX_EXPORT_METHOD(@selector(getJsVersion:))

@synthesize weexInstance;

/** 下载jsbundle资源方法 */
- (void)download:(NSDictionary *)info :(WXModuleKeepAliveCallback)callback
{
    if (!info[@"path"] || !info[@"diff"]) {
        WXLogError(@"[BM Error] Params error: %@",info);
        return;
    }

    self.callback = callback;
    [[BMResourceManager sharedInstance] downloadJsBundle:info
                                               completed:^(BOOL success, NSString *msg) {
                                                  
                                                   if (self.callback) {
                                                       NSDictionary *resData = [NSDictionary configCallbackDataWithResCode:success ? BMResCodeSuccess : BMResCodeError msg:msg data:nil];
                                                       self.callback(resData, YES);
                                                   }
                                               }];
}

/** 应用更新 */
- (void)update
{
    [[NSNotificationCenter defaultCenter] postNotificationName:K_BMAppReStartNotification object:nil];
}

/** 获取当前jsVersion */
- (void)getJsVersion:(WXModuleCallback)callback
{
    NSDictionary * userInfo = [[BMResourceManager sharedInstance] loadConfigData:K_JS_VERSION_PATH];
    NSString *jsVerson = @"";
    if ([userInfo isKindOfClass:[NSDictionary class]]) {
        jsVerson = userInfo[@"jsVersion"] ? userInfo[@"jsVersion"]:@"";
    }
    
    if (callback) {
        callback(jsVerson);
    }
}

@end
