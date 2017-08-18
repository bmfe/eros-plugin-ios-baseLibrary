//
//  BMImageManager.h
//  WeexDemo
//
//  Created by XHY on 2017/2/10.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WeexSDK/WeexSDK.h>
#import "BMUploadImageModel.h"

@interface BMImageManager : NSObject

+ (void)uploadImageWithInfo:(BMUploadImageModel *)model weexInstance:(WXSDKInstance *)weexInstance callback:(WXModuleCallback)callback;

+ (void)uploadImage:(NSArray<UIImage *> *)images callback:(WXModuleCallback)callback;

@end
