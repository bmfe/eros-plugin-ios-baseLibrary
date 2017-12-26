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
        if (callback) {
            callback([NSNumber numberWithBool:success]);
        }
    }];
}

/** 存储数据 同步方法 */
- (BOOL)setDataSync:(NSString *)key data:(id)data
{
    if (![data isKindOfClass:[NSString class]]) {
        data = [data yy_modelToJSONString];
    }
    
    if (!data || !key) return @0;
    
    BOOL success = [[BMDB DB] addOrUpdateData:data primatyKey:key];
    
    return success;
}

- (void)getData:(NSString *)key callback:(WXModuleCallback)callback
{
    if (!key) return;

    id resData = [[BMDB DB] queryWithPrimatyKey:key];
    if (callback) {
        callback(resData);
    }
}

/** 获取数据 同步方法 */
- (id)getDataSync:(NSString *)key
{
    id resData = [[BMDB DB] queryWithPrimatyKey:key];
    return resData;
}

- (void)deleteData:(NSString *)key callback:(WXModuleCallback)callback
{
    if (!key) return;
    
    [[BMDB DB] deleteWithPrimatyKey:key success:^(BOOL success) {
        if (callback) {
            callback([NSNumber numberWithBool:success]);
        }
    }];
}

/** 删除一条数据 同步方法 */
- (BOOL)deleteDataSync:(NSString *)key
{
    if (!key) return nil;
    
    BOOL success = [[BMDB DB] deleteWithPrimatyKey:key];
    return success;
}

- (void)removeData:(WXModuleCallback)callback
{
    [[BMDB DB] deleteAllSuccess:^(BOOL success) {
        if (callback) {
            callback([NSNumber numberWithBool:success]);
        }
    }];
}

/** 删除所有数据 同步方法 */
- (BOOL)removeDataSync
{
    BOOL success = [[BMDB DB] deleteAll];
    return success;
}
@end
