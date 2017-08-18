//
//  BMUploadImageRequest.m
//  WeexDemo
//
//  Created by XHY on 2017/2/10.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMUploadImageRequest.h"
#import <AFURLRequestSerialization.h>

@implementation BMUploadImageRequest

- (instancetype)initWithImage:(UIImage *)image
{
    if (self = [super init]) {
        _image = image;
    }
    return self;
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

- (BOOL)useCDN
{
    return YES;
}

- (NSString *)requestUrl
{
    return TK_PlatformInfo().url.uploadImageApi;
}

- (AFConstructingBlock)constructingBodyBlock {
    return ^(id<AFMultipartFormData> formData) {
        NSData *data = UIImageJPEGRepresentation(_image, 0.8);
        NSString *name = @"picture";
        NSString *formKey = @"file";
        NSString *type = @"image/jpeg";
        [formData appendPartWithFileData:data name:formKey fileName:name mimeType:type];
    };
}

@end
