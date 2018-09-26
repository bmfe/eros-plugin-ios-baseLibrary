//
//  BMBaseRequest.m
//  WeexDemo
//
//  Created by XHY on 2017/1/13.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMBaseRequest.h"
#import "BMDeviceManager.h"
#import "NSString+Util.h"
#import "BMDefine.h"
#import "YYModel.h"
#import "BMUserInfoModel.h"

@implementation BMBaseRequest

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGET;
}

- (YTKRequestSerializerType)requestSerializerType
{
    return YTKRequestSerializerTypeJSON;
}

- (void)startRequestResult:(RequestResultBlock)resultBlock
{
    
    [self startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        
        WXLogInfo(@"%@ Request_URL>>>>>>>>>>>>>>>>:%@",NSStringFromClass([self class]),request.requestTask.originalRequest);
        
        NSNumber *status = [NSNumber numberWithInteger:request.responseStatusCode ?: -1];
        NSString *errorMsg = @"";
        id data = request.responseObject ?: @{};
        id headers = request.responseHeaders ? : @{};
        NSDictionary *resData = @{
                                  @"header":headers,
                                  @"status": status,
                                  @"errorMsg": errorMsg,
                                  @"data": data
                                  };
        if (resultBlock) {
            resultBlock(resData);
        }
        
    } failure:^(YTKBaseRequest *request) {
        
        WXLogError(@"%@ Request_URL>>>>>>>>>>>>>>>>:%@ \n\n\n",NSStringFromClass([self class]),request.requestTask.originalRequest);
        
        // 获取错误code
        NSInteger resCode = request.responseStatusCode ?: request.error.code;
        NSString *errorCode = resCode ? [NSString stringWithFormat:@"%d",resCode] : @"-1";
        
        NSString *errmsg = [errorCode integerValue] >= -1 ? [NSString getStatusText:[errorCode integerValue]] : request.error.localizedDescription ?: [NSString getStatusText:[errorCode integerValue]];
        NSString *msg = [NSString stringWithFormat:@"%@(Code:%@)",errmsg,errorCode];
        
        NSDictionary *resData = @{
                                  @"status": errorCode,
                                  @"errorMsg": msg,
                                  @"data": @{}
                                  };
        
        if (resultBlock) {
            resultBlock(resData);
        }
        
    }];
}

@end
