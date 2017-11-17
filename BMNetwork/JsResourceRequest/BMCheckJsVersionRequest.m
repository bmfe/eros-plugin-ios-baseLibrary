//
//  BMCheckJsVersionRequest.m
//  WeexDemo
//
//  Created by XHY on 2017/1/10.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMCheckJsVersionRequest.h"
#import "BMConfigManager.h"

@interface BMCheckJsVersionRequest()

@property (nonatomic,readwrite)NSString * appName;

@property (nonatomic,readwrite)NSString * appVersion;

@property (nonatomic,readwrite)NSString * jsVersion;

@property (nonatomic,readwrite)BOOL isDiff;
@end



@implementation BMCheckJsVersionRequest

- (instancetype)initWithAppName:(NSString *)appName appVersion:(NSString *)appVersion jsVersion:(NSString *)jsVersion isDiff:(BOOL)isDiff
{
    if (self = [super init]) {
        _appName = appName;
        _appVersion = appVersion;
        _jsVersion = jsVersion;
        _isDiff= isDiff;
    }
    return self;
}

- (NSString *)requestURLPath
{
    return [self requestUrl];
}

- (NSString *)requestUrl
{
    return [BMConfigManager shareInstance].platform.url.bundleUpdate;
}

- (id)requestArgument
{
    return @{
             @"appName": _appName,
             @"iOS": _appVersion,
             @"jsVersion": _jsVersion,
             @"isDiff": [NSNumber numberWithBool:_isDiff]
             };
}

@end
