//
//  BMGetEnvironment.m
//  BM-JYT
//
//  Created by 窦静轩 on 2017/3/23.
//  Copyright © 2017年 XHY. All rights reserved.
//

#import "BMGetEnvironment.h"
#import <WeexSDK/WXUtility.h>
#import <WeexSDK/WXAppConfiguration.h>
#import <WeexSDK/WXSDKEngine.h>
#import <sys/utsname.h>

#import "BMDeviceManager.h"
#import "BMConfigManager.h"

#define BM_FONT_SIZE @"bmFontSize"

#define BM_REQUEST_URL @"requestUrl"

#define BM_LOCAL_URL @"baseUrl"

#define BM_FONT_SCALE @"bmFontScale"


@implementation BMGetEnvironment

+ (NSDictionary *)bm_getEnvironment
{
    NSString *platform = @"iOS";
    NSString *sysVersion = [[UIDevice currentDevice] systemVersion] ?: @"";
    NSString *weexVersion = WX_SDK_VERSION;
    
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *machineValue = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    
    NSString *machine = machineValue ? : @"";
    NSString *appVersion = [WXAppConfiguration appVersion] ? : @"";
    NSString *appName = [WXAppConfiguration appName] ? : @"";
    
    CGFloat deviceWidth = [WXUtility portraitScreenSize].width;
    CGFloat deviceHeight = [WXUtility portraitScreenSize].height;
    CGFloat scale = [[UIScreen mainScreen] scale];
    
    NSMutableDictionary *data = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                                @"platform":platform,
                                                                                @"osVersion":sysVersion,
                                                                                @"weexVersion":weexVersion,
                                                                                @"deviceModel":machine,
                                                                                @"appName":appName,
                                                                                @"appVersion":appVersion,
                                                                                @"deviceWidth":@(deviceWidth * scale),
                                                                                @"deviceHeight":@(deviceHeight * scale),
                                                                                @"scale":@(scale),
                                                                                @"logLevel":[WXLog logLevelString] ?: @"error"
                                                                                }];
    
    
    if ([WXSDKEngine customEnvironment]) {
        [data addEntriesFromDictionary:[WXSDKEngine customEnvironment]];
    }
    
    
    //添加前端所需要字段 目前是 fontSize 还有 请求的URL
    NSMutableDictionary * bmData = [NSMutableDictionary dictionaryWithDictionary:data];
    
    //添加fontSize
    
    NSString *currentFontSize = [[NSUserDefaults standardUserDefaults] valueForKey:K_FONT_SIZE_KEY] ? [[NSUserDefaults standardUserDefaults] valueForKey:K_FONT_SIZE_KEY]:K_FONT_SIZE_NORM;
    
    if(currentFontSize){
        [bmData setObject:currentFontSize forKey:BM_FONT_SIZE];
        
        CGFloat bmFontScale;
        
        if ([currentFontSize isEqualToString:K_FONT_SIZE_NORM]) {
            bmFontScale = 1.0;
        }
        else if ([currentFontSize isEqualToString:K_FONT_SIZE_BIG]){
            bmFontScale = K_FontSizeBig_Scale;
        }
        else if ([currentFontSize isEqualToString:k_FONT_SIZE_EXTRALARGE]){
            bmFontScale = K_FontSizeExtralarge_Scale;
        }
        else{
             bmFontScale = 1.0;
        }
        [bmData setObject:[NSNumber numberWithFloat:bmFontScale] forKey:BM_FONT_SCALE];
    }
    
    //添加当前更新接口URL
    if ([BMConfigManager shareInstance].platform.url.request.length) {
        
        [bmData setObject:[BMConfigManager shareInstance].platform.url.request forKey:BM_REQUEST_URL];
    }
    
    //添加当前入口      
    if([BMConfigManager shareInstance].platform.url.local.length){
        [bmData setObject:[BMConfigManager shareInstance].platform.url.local forKey:BM_LOCAL_URL];
    }
    
    // 添加 deviceId
    NSString *deviceId = [BMDeviceManager deviceID];
    if (deviceId) {
        [bmData setObject:deviceId forKey:@"deviceId"];
    }
    
    return bmData;
}

@end
