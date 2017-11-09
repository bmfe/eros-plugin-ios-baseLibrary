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
{
    id _params;
}

- (instancetype)initWithImage:(UIImage *)image params:(id)params
{
    if (self = [super init]) {
        _image = image;
        _params = params;
    }
    return self;
}

- (YTKRequestMethod)requestMethod
{
    return YTKRequestMethodPOST;
}

- (NSString *)baseUrl
{
    return nil;
}

- (NSString *)requestUrl
{
    return TK_PlatformInfo().url.image;
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

- (id)requestArgument
{
    return _params;
}

@end
