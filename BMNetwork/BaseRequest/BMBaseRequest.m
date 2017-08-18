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
        
        if (resultBlock) {
            resultBlock(request.responseObject);
        }
        
    } failure:^(YTKBaseRequest *request) {
        
        // 获取错误code
        NSString *errorCode = [NSString stringWithFormat:@"(Code:%ld)",(long)request.responseStatusCode];
        WXLogError(@"%@",errorCode);
        WXLogError(@"%@ Request_URL>>>>>>>>>>>>>>>>:%@ \n\n\n",NSStringFromClass([self class]),request.requestTask.originalRequest);
        
        NSString *msg = [NSString stringWithFormat:@"网络请求出错%@",errorCode];
        
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:errorCode,@"resCode",msg,@"msg",@{},@"data", nil];
        if (resultBlock) {
            resultBlock(dic);
        }
        
    }];
}

@end
