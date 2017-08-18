//
//  BMUploadImageUtils.h
//  WeexDemo
//
//  Created by XHY on 2017/2/10.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WeexSDK.h>
#import "BMUploadImageModel.h"

@interface BMUploadImageUtils : NSObject

- (void)uploadImageWithInfo:(BMUploadImageModel *)info weexInstance:(WXSDKInstance *)weexInstance callback:(WXModuleCallback)callback;


/**
 上传图片 支持多张

 @param images 图片
 @param callback 回调
 */
- (void)uploadImage:(NSArray<UIImage *> *)images callback:(WXModuleCallback)callback;

@end
