//
//  BMAuthorLoginModule.m
//  Pods
//
//  Created by XHY on 2017/5/5.
//
//

#import "BMAuthorLoginModule.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface BMAuthorLoginModule()

@end

@implementation BMAuthorLoginModule
@synthesize weexInstance;

WX_EXPORT_METHOD_SYNC(@selector(canUseTouchId))
WX_EXPORT_METHOD(@selector(touchId:callback:))


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

- (void)touchId:(NSDictionary *)info callback:(WXModuleCallback)callback
{
    NSDictionary *resData = [self canUseTouchId];
    if ([[resData objectForKey:@"resData"] integerValue] == 9) {
        if (callback) {
            callback(resData);
        }
        return;
    }
    
    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    
    NSString *title = [info objectForKey:@"title"];
    
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
            localizedReason: title?:@"指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
                if (success) {
                    if (callback) {
                        NSDictionary *resData = [NSDictionary configCallbackDataWithResCode:BMResCodeSuccess msg:@"指纹验证成功" data:nil];
                        callback(resData);
                    }
                }else{
                    NSString *msg = @"";
                    switch (error.code) {
                        case LAErrorSystemCancel:
                        {
                            msg = @"系统取消授权";
                            break;
                        }
                        case LAErrorUserCancel:
                        {
                            msg = @"用户取消验证";
                            break;
                        }
                        case LAErrorAuthenticationFailed:
                        {
                            msg = @"授权失败";
                            break;
                        }
                        case LAErrorPasscodeNotSet:
                        {
                            msg = @"系统未设置密码";
                            break;
                        }
                        default:
                        {
                            msg = @"设备Touch ID不可用";
                            break;
                        }
                    }
                    if (callback) {
                        NSDictionary *resData = [NSDictionary configCallbackDataWithResCode:BMResCodeError msg:msg data:nil];
                        callback(resData);
                    }
                }
            }];
    
    
}


@end
