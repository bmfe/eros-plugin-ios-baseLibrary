//
//  BMUmengModule.m
//  BMBaseLibrary
//
//  Created by XHY on 2018/4/18.
//

#import "BMUmengModule.h"
#import "BMShareModel.h"
#import "YYModel.h"
#import <UMShare/UMShare.h>
#import <UMCommon/UMConfigure.h>
#import <WeexPluginLoader/WeexPluginLoader.h>

WX_PlUGIN_EXPORT_MODULE(bmUM, BMUmengModule)

@implementation BMUmengModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(initUM:))
WX_EXPORT_METHOD(@selector(initPlatform:))
WX_EXPORT_METHOD(@selector(share:successCallback:failedCallback:))

/** 初始化友盟方法 */
- (void)initUM:(NSString *)appkey
{
    /* 初始化友盟组件 */
    [UMConfigure initWithAppkey:appkey channel:nil];
}

/** 初始化三方平台 */
- (void)initPlatform:(NSDictionary *)info
{
    NSString *platf = info[@"platform"];
    NSString *appKey = info[@"appKey"];
    NSString *appSecret = info[@"appSecret"];
    NSString *redirectURL = info[@"redirectURL"];
    UMSocialPlatformType platform = UMSocialPlatformType_UnKnown;
    
    if ([platf isEqualToString:K_SharePlatformWechatSession]) {
        platform = UMSocialPlatformType_WechatSession;
    }
    else if ([platf isEqualToString:K_SharePlatformWechatTimeLine])
    {
        platform = UMSocialPlatformType_WechatTimeLine;
    }
    
    [[UMSocialManager defaultManager] setPlaform:platform
                                          appKey:appKey
                                       appSecret:appSecret
                                     redirectURL:redirectURL];
}

/** 分享 */
- (void)share:(NSDictionary *)info successCallback:(WXModuleCallback)successCallback failedCallback:(WXModuleCallback)failedCallback
{
    BMShareModel *model = [BMShareModel yy_modelWithJSON:info];
    
    /**
     分享功能
     */
    NSString *shareTitle = model.title?:@"";
    NSString *shareText = model.content?:@"";
    NSString *shareUrl = model.url;
    id shareImage = model.image;
    
    UMSocialPlatformType platformType = UMSocialPlatformType_UnKnown;
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    /** 分享平台 */
    //微信聊天
    if (model.platform == BMSharePlatformType_WechatSession)
    {
        platformType = UMSocialPlatformType_WechatSession;
    }
    //微信朋友圈
    else if (model.platform == BMSharePlatformType_WechatTimeLine)
    {
        platformType = UMSocialPlatformType_WechatTimeLine;
    }
    
    /** 分享类型 */
    //文本
    if (model.shareType == BMShareTypeText) {
        messageObject.text = shareText;
    }
    //图片
    else if (model.shareType == BMShareTypeImage)
    {
        UMShareImageObject *shareObject = [[UMShareImageObject alloc] init];
        shareObject.shareImage = shareImage;
        messageObject.shareObject = shareObject;
    }
    //图文
    else if (model.shareType == BMShareTypeTextImage)
    {
        UMShareImageObject *shareObject = [UMShareImageObject shareObjectWithTitle:shareTitle descr:shareText thumImage:nil];
        shareObject.shareImage = shareImage;
        messageObject.text = shareText;
        messageObject.shareObject = shareObject;
    }
    //音乐
    else if (model.shareType == BMShareTypeMusic)
    {
        UMShareMusicObject *shareObject = [UMShareMusicObject shareObjectWithTitle:shareTitle descr:shareText thumImage:shareImage];
        shareObject.musicUrl = shareUrl;
        messageObject.shareObject = shareObject;
    }
    //视频
    else if (model.shareType == BMShareTypeVideo)
    {
        UMShareVideoObject *shareObject = [UMShareVideoObject shareObjectWithTitle:shareTitle descr:shareText thumImage:shareImage];
        shareObject.videoUrl = shareUrl;
        messageObject.shareObject = shareObject;
    }
    //小程序
    else if (model.shareType == BMShareTypeMiniProgram)
    {
        UMShareMiniProgramObject *shareObject = [UMShareMiniProgramObject shareObjectWithTitle:shareTitle descr:shareText thumImage:shareImage];
        shareObject.webpageUrl = shareUrl;
        shareObject.path = model.path;
        messageObject.shareObject = shareObject;
    }
    //网页
    else
    {
        UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:shareTitle descr:shareText thumImage:shareImage];
        shareObject.webpageUrl = shareUrl;
        messageObject.text = shareText;
        messageObject.shareObject = shareObject;
    }
    
    //设置分享内容
    [[UMSocialManager defaultManager] shareToPlatform:platformType
                                        messageObject:messageObject
                                currentViewController:[BMMediatorManager shareInstance].currentViewController
                                           completion:^(id result, NSError *error) {
                                               if (error) {
                                                   WXLogError(@"%@",error);
                                                   
                                                   /* 失败回调 */
                                                   if (failedCallback) {
                                                       NSDictionary *data = [NSDictionary configCallbackDataWithResCode:BMResCodeError msg:@"分享失败" data:nil];
                                                       failedCallback(data);
                                                   }
                                                   
                                               } else {
                                                   
                                                   /* 成功回调 */
                                                   if (successCallback) {
                                                       NSDictionary *data = [NSDictionary configCallbackDataWithResCode:BMResCodeSuccess msg:@"分享成功" data:nil];
                                                       successCallback(data);
                                                   }
                                               }
                                           }];
}

/** 调用微信登录 */
- (void)wechat:(NSDictionary *)info callback:(WXModuleCallback)success
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
                NSMutableDictionary *userInfo = [resp yy_modelToJSONObject];
                NSDictionary *resDic = [NSDictionary configCallbackDataWithResCode:BMResCodeSuccess msg:@"微信授权成功" data:userInfo];
                success(resDic);
            }
            
        }
        
    }];
}

@end
