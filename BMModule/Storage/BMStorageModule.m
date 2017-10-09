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

WX_EXPORT_METHOD_SYNC(@selector(setDataSync:data:))
WX_EXPORT_METHOD_SYNC(@selector(getDataSync:))
WX_EXPORT_METHOD_SYNC(@selector(deleteDataSync:))
WX_EXPORT_METHOD_SYNC(@selector(removeDataSync))

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

/** 存储数据 同步方法 */
- (NSDictionary *)setDataSync:(NSString *)key data:(id)data
{
    if (![data isKindOfClass:[NSString class]]) {
        data = [data yy_modelToJSONString];
    }
    
    if (!data || !key) return [NSDictionary configCallbackDataWithResCode:BMResCodeError msg:@"存储失败，请检查数据" data:nil];
    
    BOOL success = [[BMDB DB] addOrUpdateData:data primatyKey:key];
    NSInteger resCode = success ? BMResCodeSuccess : BMResCodeError;
    NSString *msg = success ? @"数据存储成功" : @"数据存储失败";
    return [NSDictionary configCallbackDataWithResCode:resCode msg:msg data:nil];
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

/** 获取数据 同步方法 */
- (NSDictionary *)getDataSync:(NSString *)key
{
    id resData = [[BMDB DB] queryWithPrimatyKey:key];
    NSInteger resCode = resData ? BMResCodeSuccess : BMResCodeError;
    NSDictionary *resultData = [NSDictionary configCallbackDataWithResCode:resCode msg:nil data:resData];
    return resultData;
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

/** 删除一条数据 同步方法 */
- (NSDictionary *)deleteDataSync:(NSString *)key
{
    if (!key) return nil;
    
    BOOL success = [[BMDB DB] deleteWithPrimatyKey:key];
    NSInteger resCode = success ? BMResCodeSuccess : BMResCodeError;
    NSDictionary *resultData = [NSDictionary configCallbackDataWithResCode:resCode msg:nil data:nil];
    return resultData;
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

/** 删除所有数据 同步方法 */
- (NSDictionary *)removeDataSync
{
    BOOL success = [[BMDB DB] deleteAll];
    NSInteger resCode = success ? BMResCodeSuccess : BMResCodeError;
    NSDictionary *resultData = [NSDictionary configCallbackDataWithResCode:resCode msg:nil data:nil];
    return resultData;
}
@end
