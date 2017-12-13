//
//  BMUploadImageUtils.m
//  WeexDemo
//
//  Created by XHY on 2017/2/10.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMUploadImageUtils.h"
#import "BMDefine.h"
#import "UIImage+Util.h"
#import "NSDictionary+Util.h"
#import <SVProgressHUD.h>

#import <MobileCoreServices/MobileCoreServices.h>

#import "BMUploadImageRequest.h"

#import <TZImagePickerController/TZImagePickerController.h>
#import <TZImageManager.h>

#import <SDWebImage/SDImageCache.h>



@interface BMUploadImageUtils () <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIAlertViewDelegate>

@property (nonatomic, weak) WXSDKInstance *weexInstance;
@property (nonatomic, copy) WXModuleCallback callback;
@property (nonatomic, strong) BMUploadImageModel *imageInfo;

@end

@implementation BMUploadImageUtils

#pragma mark - Setter / Getter

#pragma mark - Custom Views

#pragma mark - Api Request


/* 先将图片上传至图片服务器然后在将返回的图片id上传至后台服务器 */
-(void)uploadImage:(NSArray<UIImage *> *)images
{
    [SVProgressHUD showWithStatus:@"处理中.."];
    
    NSMutableArray *arr4Request = [NSMutableArray array];
    for (UIImage *image in images) {
        BMUploadImageRequest *api = [[BMUploadImageRequest alloc] initWithImage:image params:_imageInfo.params];
        [arr4Request addObject:api];
    }
    
    YTKBatchRequest *batchRequest = [[YTKBatchRequest alloc] initWithRequestArray:arr4Request];
    
    [batchRequest startWithCompletionBlockWithSuccess:^(YTKBatchRequest * _Nonnull batchRequest) {
        
        [SVProgressHUD dismiss];
        
        NSMutableArray *arr4ImagesUrl = [NSMutableArray array];
        
        for (BMUploadImageRequest *request in batchRequest.requestArray) {
            NSDictionary *result = [request responseObject];
            [arr4ImagesUrl addObject:result];
        }
        
        NSDictionary *backData = [NSDictionary configCallbackDataWithResCode:BMResCodeSuccess msg:nil data:arr4ImagesUrl];
        if (self.callback) {
            self.callback(backData);
        }
        
    } failure:^(YTKBatchRequest * _Nonnull batchRequest) {
        [SVProgressHUD dismiss];
        
    }];
}

#pragma mark - Private Method
- (void)selectImage
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                       delegate:self
                                              cancelButtonTitle:@"取消"
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:@"拍照", @"去相册选择", nil];
    
    [sheet showInView:[UIApplication sharedApplication].keyWindow];
}

//相册
-(void)LocalPhoto{
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:self.imageInfo.maxCount delegate:nil];
    
    /* 设置图片自动裁剪尺寸 */
    
    if (self.imageInfo.imageWidth > 0) {
        imagePickerVc.photoWidth = self.imageInfo.imageWidth;
    }
    
    /* 设置不允许选择视频/gif/原图 */
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.allowTakePicture = NO;
    
    /* 判断是否是上传头像如果是则 允许裁剪图片 */
    if (self.imageInfo.allowCrop && self.imageInfo.maxCount == 1) {
        imagePickerVc.allowCrop = YES;
        imagePickerVc.cropRect = CGRectMake(0, ([UIScreen mainScreen].bounds.size.height - [UIScreen mainScreen].bounds.size.width) / 2.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    }
    
    __weak typeof(self)weakSelf = self;
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        [weakSelf uploadImage:photos];
        
    }];
    
    [self.weexInstance.viewController presentViewController:imagePickerVc animated:YES completion:nil];
    
}

//拍照
-(void)takePhoto{
    
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        // 无相机权限 做一个友好的提示
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        [alert show];
        // 拍照之前还需要检查相册权限
    } else if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusDenied) { // 已被拒绝，没有相册权限，将无法保存拍的照片
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        alert.tag = 1;
        [alert show];
    } else if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusNotDetermined) { // 正在弹框询问用户是否允许访问相册，监听权限状态
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            return [self takePhoto];
        });
    } else { // 调用相机
        //资源类型为照相机
        UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
        //判断是否有相机
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            /* 判断是否是上传头像如果是则 允许裁剪图片 */
            if (self.imageInfo.allowCrop && self.imageInfo.maxCount == 1) picker.allowsEditing = YES;
            //资源类型为照相机
            picker.sourceType = sourceType;
            [self.weexInstance.viewController presentViewController:picker animated:YES completion:nil];
            
        }else {
            WXLogInfo(@"该设备无摄像头");
        }
    }
}

- (void)saveImage:(UIImage *)image {
    
    if (!image) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        CGSize asize = CGSizeMake(self.imageInfo.imageWidth, self.imageInfo.imageWidth * image.size.height / image.size.width);
        
        UIImage *smallImage = [image imageToSize:asize];

        if (!smallImage) {
            WXLogError(@"图片不存在");
            return;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // 上传服务器
            [self uploadImage:@[smallImage]];
        });
        
    });
}

#pragma mark - Custom Delegate & DataSource


#pragma mark - System Delegate & DataSource

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 1) {
        [self LocalPhoto];
    }
    else if (buttonIndex == 0) {
        [self takePhoto];
    }
    
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) { // 去设置界面，开启相机访问权限
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqualToString:(__bridge NSString *)kUTTypeImage]) {
        UIImage *img = [info objectForKey:UIImagePickerControllerEditedImage];
        if (!img) img = [info objectForKey:UIImagePickerControllerOriginalImage];
        
        [self saveImage:img];
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Public Method

- (void)uploadImageWithInfo:(BMUploadImageModel *)info weexInstance:(WXSDKInstance *)weexInstance callback:(WXModuleCallback)callback
{
    self.imageInfo = info;
    self.weexInstance = weexInstance;
    self.callback = callback;
    [self selectImage];
}

- (void)uploadImage:(NSArray<UIImage *> *)images callback:(WXModuleCallback)callback
{
    self.callback = callback;
    [self uploadImage:images];
}

@end
