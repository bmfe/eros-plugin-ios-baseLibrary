//
//  BMAuthorLoginModule.m
//  Pods
//
//  Created by XHY on 2017/5/5.
//
//

#import "BMAuthorLoginModule.h"
#import <UMengUShare/WXApi.h>
#import <UMSocialCore/UMSocialCore.h>
#import <LocalAuthentication/LocalAuthentication.h>

@interface BMAuthorLoginModule()<WXApiDelegate>

@end

@implementation BMAuthorLoginModule
@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(wechat:success:))

WX_EXPORT_METHOD_SYNC(@selector(canUseTouchId))

/** 调用微信登录 */
- (void)wechat:(NSDictionary *)info success:(WXModuleCallback)success
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:weexInstance.viewController completion:^(id result, NSError *error) {
       
        if (error) {
            WXLogError(@"%@",error);
            NSDictionary *resDic = [NSDictionary configCallbackDataWithResCode:BMResCodeSuccess msg:@"微信授权失败" data:nil];
            if (success) {
                success(resDic);
            }
        } else {
            UMSocialUserInfoResponse *resp = result;
            
            if (success) {
                NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
                [userInfo setValue:resp.uid?:@"" forKey:@"uid"];
                [userInfo setValue:resp.name?:@"" forKey:@"name"];
                NSDictionary *resDic = [NSDictionary configCallbackDataWithResCode:BMResCodeSuccess msg:@"微信授权成功" data:userInfo];
                success(resDic);
            }
            
        }
        
    }];
}

- (NSDictionary *)canUseTouchId
{
    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    
    BMResCode code = BMResCodeSuccess;
    NSString *msg = @"此设备支持使用 Touch ID";
    
    if (![context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        
        code = BMResCodeError;
        //不支持指纹识别
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
            {
                msg = @"TouchID is not enrolled";
                break;
            }
            case LAErrorPasscodeNotSet:
            {
                msg = @"A passcode has not been set";
                break;
            }
            default:
            {
                msg = @"TouchID not available";
                break;
            }
        }
    }
    
    WXLogInfo(@"%@",msg);
    
    return [NSDictionary configCallbackDataWithResCode:code msg:msg data:nil];
}


@end
