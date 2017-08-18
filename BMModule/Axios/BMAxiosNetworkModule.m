//
//  BMAxiosNetworkModule.m
//  WeexDemo
//
//  Created by XHY on 2017/1/13.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMAxiosNetworkModule.h"
#import "BMAxiosRequestModel.h"
#import "BMCommonRequest.h"
#import "BMBaseViewController.h"
#import "BMUserInfoModel.h"

@implementation BMAxiosNetworkModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(fetch:callback:))

- (void)fetch:(NSDictionary *)info callback:(WXModuleCallback)callback
{
    /* 添加判断 */
    if (![info isKindOfClass:[NSDictionary class]]) {
        WXLogError(@"js request info Error");
        return;
    }
    
    WXLogInfo(@"js request info: %@",info);
    
    BMAxiosRequestModel *requestModel = [BMAxiosRequestModel yy_modelWithJSON:info];
    
    BMCommonRequest *api = [[BMCommonRequest alloc] initWithRequestModel:requestModel];
    
    [((BMBaseViewController *)weexInstance.viewController) addRequest:api];
    
    [api startRequestResult:^(id data) {
       
        WXLogInfo(@"request data: %@",data);
        
        if (callback) {
            callback(data);
        }
        
    }];
    
    WXLogInfo(@"%@",api.originalRequest);
}

@end
