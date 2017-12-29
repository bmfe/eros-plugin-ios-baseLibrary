//
//  BMImageModule.m
//  BMBaseLibrary
//
//  Created by XHY on 2017/12/29.
//

#import "BMImageModule.h"

#import <SDWebImage/SDImageCache.h>
#import "PBViewController.h"
#import <objc/runtime.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "BMImageManager.h"
#import <BMScreenshotEventManager.h>

#import "BMUploadImageModel.h"
#import <YYModel/YYModel.h>

#import <TZImagePickerController/TZImagePickerController.h>

static NSString * indexKey = @"index";
static NSString * imagesKey = @"images";
static NSString * typeKey = @"type";
static NSString * localKey = @"local";
static NSString * networkKey = @"network";

@interface BMImageModule () <PBViewControllerDelegate,PBViewControllerDataSource>
{
    PBViewController * _photoBrowser;
}

@property (nonatomic,strong)NSMutableArray * images;

@end

@implementation BMImageModule
@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(uploadImage::))
WX_EXPORT_METHOD(@selector(uploadScreenshot:))
WX_EXPORT_METHOD(@selector(preview::))

/** 拍照 */
- (void)camera:(NSDictionary *)info :(WXModuleCallback)callback
{
    
}

/** 从相册选择图片最多9张 */
- (void)pick:(NSDictionary *)info :(WXModuleCallback)callback
{
    
}

/** 可选择拍照或者从相册选择图片上传至服务器 */
- (void)uploadImage:(NSDictionary *)info :(WXModuleCallback)callback
{
    BMUploadImageModel *model = [BMUploadImageModel yy_modelWithJSON:info];
    [BMImageManager uploadImageWithInfo:model weexInstance:weexInstance callback:callback];
}

/** 将刚刚的截屏图片上传到服务器 */
- (void)uploadScreenshot:(WXModuleCallback)callback
{
    if (![[BMScreenshotEventManager shareInstance] snapshotImage]) {
        NSDictionary *resDic = [NSDictionary configCallbackDataWithResCode:BMResCodeError msg:@"截屏图片不存在" data:nil];
        if (callback) {
            callback(resDic);
        }
        return;
    }
    NSArray *images = @[[[BMScreenshotEventManager shareInstance] snapshotImage]];
    [BMImageManager uploadImage:images callback:callback];
}

/** 预览图片 */
- (void)preview:(NSDictionary *)info :(WXModuleCallback)callback
{
    if ([info isKindOfClass:[NSDictionary class]]) {
        NSArray * images = [(NSDictionary*)info objectForKey:imagesKey];
        NSNumber * index = [(NSDictionary*)info objectForKey:indexKey];
        NSString * type = [(NSDictionary*)info objectForKey:typeKey];
        
        
        NSMutableArray * imagsArray = [[NSMutableArray alloc] initWithCapacity:0];
        
        BOOL isLocal = NO;
        if ([images isKindOfClass:[NSArray class]]) {
            for (int i = 0; i < images.count; i++) {
                NSString * url = [images objectAtIndex:i];
                
                if ([type isEqualToString:localKey]) {
                    isLocal = YES;
                    UIImage * image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:[url md5]];
                    if (nil != image) {
                        [imagsArray addObject:image];
                    }
                    
                }
                if ([type isEqualToString:networkKey]) {
                    isLocal = NO;
                    if (nil != url) {
                        [imagsArray addObject:url];
                    }
                }
            }
            
            if (nil != self.images) {
                [self.images removeAllObjects];
                self.images = nil;
            }
            self.images = [[NSMutableArray alloc] initWithArray:imagsArray];
            
            if (nil != _photoBrowser) {
                _photoBrowser = nil;
            }
            
            _photoBrowser = [PBViewController new];
            _photoBrowser.pb_dataSource = self;
            _photoBrowser.pb_delegate = self;
            _photoBrowser.pb_startPage = [index integerValue];
            
            [weexInstance.viewController presentViewController:_photoBrowser animated:YES completion:^{
                if (callback) {
                    callback([NSDictionary dictionary]);
                }
            }];
            
        }
    }
}

#pragma mark - PBViewControllerDataSource

- (NSInteger)numberOfPagesInViewController:(PBViewController *)viewController {
    return self.images.count;
}

- (void)viewController:(PBViewController *)viewController presentImageView:(UIImageView *)imageView forPageAtIndex:(NSInteger)index progressHandler:(void (^)(NSInteger, NSInteger))progressHandler {
    
    NSString *url = self.images[index]?:@"";
    UIImage *placeholder = nil;
    [imageView sd_setImageWithURL:[NSURL URLWithString:url]
                 placeholderImage:placeholder
                          options:0
                         progress:progressHandler
                        completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                        }];
}

- (UIView *)thumbViewForPageAtIndex:(NSInteger)index {
    return nil;
}

#pragma mark - PBViewControllerDelegate

- (void)viewController:(PBViewController *)viewController didSingleTapedPageAtIndex:(NSInteger)index presentedImage:(UIImage *)presentedImage {
    [_photoBrowser dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewController:(PBViewController *)viewController didLongPressedPageAtIndex:(NSInteger)index presentedImage:(UIImage *)presentedImage {
    NSLog(@"didLongPressedPageAtIndex: %@", @(index));
}

@end
