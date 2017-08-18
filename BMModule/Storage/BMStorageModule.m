//
//  BMStorageModule.m
//  WeexDemo
//
//  Created by XHY on 2017/2/8.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMStorageModule.h"
#import "BMDB.h"
#import "NSDictionary+Util.h"
#import "BMUserInfoModel.h"
#import <YYModel.h>
#import "BMMediatorManager.h"
#import "BMPushMessageManager.h"

@implementation BMStorageModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(setData:data:callback:))
WX_EXPORT_METHOD(@selector(getData:callback:))
WX_EXPORT_METHOD(@selector(deleteData:callback:))
WX_EXPORT_METHOD(@selector(removeData:))

- (void)setData:(NSString *)key data:(id)data callback:(WXModuleCallback)callback
{
    if (![data isKindOfClass:[NSString class]]) {
        data = [data yy_modelToJSONString];
    }
    
    if (!data || !key) return;
    
    [[BMDB DB] addOrUpdateData:data primatyKey:key success:^(BOOL success) {
        NSInteger resCode = success ? BMResCodeSuccess : BMResCodeError;
        if (callback) {
            NSDictionary *resultData = [NSDictionary configCallbackDataWithResCode:resCode msg:nil data:nil];
            callback(resultData);
        }
    }];
    
    if ([key isEqualToString:@"userInfo"]) {
        [[BMUserInfoModel shareInstance] yy_modelSetWithJSON:data];
    }
}

- (void)getData:(NSString *)key callback:(WXModuleCallback)callback
{
    if (!key) return;
    
    id resData = [[BMDB DB] queryWithPrimatyKey:key];
    if (callback) {
        NSInteger resCode = resData ? BMResCodeSuccess : BMResCodeError;
        NSDictionary *resultData = [NSDictionary configCallbackDataWithResCode:resCode msg:nil data:resData];
        callback(resultData);
    }
}

- (void)deleteData:(NSString *)key callback:(WXModuleCallback)callback
{
    if (!key) return;
    
    [[BMDB DB] deleteWithPrimatyKey:key success:^(BOOL success) {
        
        NSInteger resCode = success ? BMResCodeSuccess : BMResCodeError;
        if (callback) {
            NSDictionary *resultData = [NSDictionary configCallbackDataWithResCode:resCode msg:nil data:nil];
            callback(resultData);
        }
        
    }];
}

- (void)removeData:(WXModuleCallback)callback
{
    [[BMDB DB] deleteAllSuccess:^(BOOL success) {
        
        NSInteger resCode = success ? BMResCodeSuccess : BMResCodeError;
        if (callback) {
            NSDictionary *resultData = [NSDictionary configCallbackDataWithResCode:resCode msg:nil data:nil];
            callback(resultData);
        }
        
    }];
}

@end
