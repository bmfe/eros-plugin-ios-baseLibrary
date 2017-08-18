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

@interface BMAuthorLoginModule()<WXApiDelegate>

@end

@implementation BMAuthorLoginModule
@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(wechat:success:))

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


@end
