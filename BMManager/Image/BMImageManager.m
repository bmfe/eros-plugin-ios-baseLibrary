//
//  BMImageManager.m
//  WeexDemo
//
//  Created by XHY on 2017/2/10.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMImageManager.h"
#import "BMUploadImageUtils.h"

@interface BMImageManager ()

@property (nonatomic, strong) BMUploadImageUtils *uploadImageUtils;

@end

@implementation BMImageManager

#pragma mark - Setter / Getter

- (BMUploadImageUtils *)uploadImageUtils
{
    if (!_uploadImageUtils) {
        _uploadImageUtils = [[BMUploadImageUtils alloc] init];
    }
    return _uploadImageUtils;
}

#pragma mark - Private Method

+ (instancetype)shareInstance
{
    static BMImageManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[BMImageManager alloc] init];
    });
    return _instance;
}

#pragma mark - Public Method


+ (void)uploadImageWithInfo:(BMUploadImageModel *)model weexInstance:(WXSDKInstance *)weexInstance callback:(WXModuleCallback)callback
{
    [[BMImageManager shareInstance].uploadImageUtils uploadImageWithInfo:model weexInstance:weexInstance callback:callback];
}

+ (void)uploadImage:(NSArray<UIImage *> *)images callback:(WXModuleCallback)callback
{
    [[BMImageManager shareInstance].uploadImageUtils uploadImage:images callback:callback];
}

@end
