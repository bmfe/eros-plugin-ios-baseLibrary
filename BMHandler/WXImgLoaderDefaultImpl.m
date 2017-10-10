/**
 * Created by Weex.
 * Copyright (c) 2016, Alibaba, Inc. All rights reserved.
 *
 * This source code is licensed under the Apache Licence 2.0.
 * For the full copyright and license information,please view the LICENSE file in the root directory of this source tree.
 */

#import "WXImgLoaderDefaultImpl.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define MIN_IMAGE_WIDTH 36
#define MIN_IMAGE_HEIGHT 36

#if OS_OBJECT_USE_OBJC
#undef  WXDispatchQueueRelease
#undef  WXDispatchQueueSetterSementics
#define WXDispatchQueueRelease(q)
#define WXDispatchQueueSetterSementics strong
#else
#undef  WXDispatchQueueRelease
#undef  WXDispatchQueueSetterSementics
#define WXDispatchQueueRelease(q) (dispatch_release(q))
#define WXDispatchQueueSetterSementics assign
#endif

#define BM_LOCAL @"bmlocal"

@interface WXImgLoaderDefaultImpl()

@property (WXDispatchQueueSetterSementics, nonatomic) dispatch_queue_t ioQueue;

@end

@implementation WXImgLoaderDefaultImpl

#pragma mark -
#pragma mark WXImgLoaderProtocol

- (id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)userInfo completed:(void(^)(UIImage *image,  NSError *error, BOOL finished))completedBlock
{
    if (!url) return nil;
 
    if ([url hasPrefix:@"//"]) {
        url = [@"https:" stringByAppendingString:url];
    }
    
    NSURL *imgUrl = [NSURL URLWithString:url];
    
    if (!imgUrl || !imgUrl.scheme) {
        WXLogError(@"image url error: %@",url);
        return nil;
    }
    else if ([imgUrl.scheme isEqualToString:BM_LOCAL])
    {
        // 拦截器
        if (BM_InterceptorOn()) {
            // 从本地读取图片
            NSString *imgPath = [NSString stringWithFormat:@"%@/%@%@",K_JS_PAGES_PATH,imgUrl.host,imgUrl.path];
            
            UIImage *img = [UIImage imageWithContentsOfFile:imgPath];
            NSError *error = nil;
            
            if (!img) {
                error = [NSError errorWithDomain:NSURLErrorDomain code:-1100 userInfo:@{NSLocalizedDescriptionKey:@"获取本地图片失败"}];
            }
            
            if (completedBlock) {
                completedBlock(img,error,YES);
            }
            
            return nil;
        } else {
            url = [NSString stringWithFormat:@"%@/fe/dist/%@%@",TK_PlatformInfo().url.jsServer,imgUrl.host,imgUrl.path];
        }
    }
    
    
    [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
        
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        
        if (completedBlock) {
            completedBlock(image,error,finished);
        }
        
    }];
    
    return nil;
    
    
//    return (id<WXImageOperationProtocol>)[[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//        
//    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//        
//        NSLog(@"imggggggggggggggg");
//        
//        image = [UIImage imageNamed:@"AppIcon"];
//        
//        if (completedBlock) {
//            completedBlock(image, error, finished);
//        }
//    }];
}

@end
