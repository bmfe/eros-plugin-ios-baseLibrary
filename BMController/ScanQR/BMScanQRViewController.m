//
//  BMScanQRViewController.m
//  WeexDemo
//
//  Created by XHY on 2017/2/4.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMScanQRViewController.h"

#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>

#import "UINavigationBar+NavigationBarExtend.h"

#import "BMDefine.h"
#import "JYTTitleLabel.h"

#import "NSDictionary+Util.h"

#import <SVProgressHUD.h>

#import <AVFoundation/AVFoundation.h>
#define ANIMATION_KEY   @"lineAnimation"

typedef NS_ENUM(NSInteger, AlertType) {
    AlertTypeNoAuthorization = 7849,
    AlertTypeOpenURL
};

@interface BMScanQRViewController ()<UIAlertViewDelegate, AVCaptureMetadataOutputObjectsDelegate>

@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;

@property (nonatomic, copy) NSString *content4QRCode;
@property (nonatomic, strong) UIImageView *line;
@property (nonatomic, strong) UIView *bgView;

@end

@implementation BMScanQRViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"扫一扫";
    
    self.navigationController.fd_prefersNavigationBarHidden = NO;
    
    /* 权限判断 */
    AVAuthorizationStatus authStatus= [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied) {
        
        // 无相机权限 做一个友好的提示
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"设置", nil];
        alert.tag = AlertTypeNoAuthorization;
        [alert show];
        
        return;
    }
    
    self.bgView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.bgView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.bgView];
    
    UIView * view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:view];
    
    
    JYTTitleLabel * label = [[JYTTitleLabel alloc] initWithFrame:CGRectMake(10, 20, K_SCREEN_WIDTH - 10 * 2, 60)];
    label.text = @"将条码放入框内，即可自动扫描";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.lineBreakMode = 0;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
    
    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Scan_pick_bg"]];
    image.frame = CGRectMake(0, 0, K_SCREEN_WIDTH - 20 * 2, K_SCREEN_WIDTH - 20 * 2);
    CGPoint pt = self.view.center;
    pt.y -= 30;
    image.center = pt;
    [view addSubview:image];
    
    
    _line = [[UIImageView alloc] initWithFrame:CGRectMake((image.frame.size.width - 220)/2, 5, 220, 2)];
    _line.image = [UIImage imageNamed:@"Scan_line"];
    [image addSubview:_line];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD showWithStatus:@"扫描器初始化中..."];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
    
    AVAuthorizationStatus authStatus= [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied) {
        return ;
    } else {
        
        self.view.backgroundColor = [UIColor blackColor];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self createView];
            
            [self addAnimation];
            
            [SVProgressHUD dismiss];
            [self.bgView removeFromSuperview];
            self.bgView = nil;
        });
        
    }
}

- (void)createView
{
    if (TARGET_IPHONE_SIMULATOR) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"当前设备不支持此项功能" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        return;
    }
    
    if (_device == nil) {
        // Device
        _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        // Input
        _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
        
        // Output
        _output = [[AVCaptureMetadataOutput alloc]init];
        [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        
        // Session
        _session = [[AVCaptureSession alloc]init];
        [_session setSessionPreset:AVCaptureSessionPresetHigh];
        if ([_session canAddInput:self.input])
        {
            [_session addInput:self.input];
        }
        
        if ([_session canAddOutput:self.output])
        {
            [_session addOutput:self.output];
        }
        
        //设置扫码支持的编码格式(如下设置条形码和二维码兼容)
        _output.metadataObjectTypes=@[
                                      AVMetadataObjectTypeUPCECode,
                                      AVMetadataObjectTypeCode39Code,
                                      AVMetadataObjectTypeCode39Mod43Code,
                                      AVMetadataObjectTypeEAN13Code,
                                      AVMetadataObjectTypeEAN8Code,
                                      AVMetadataObjectTypeCode93Code,
                                      AVMetadataObjectTypeCode128Code,
                                      AVMetadataObjectTypePDF417Code,
                                      AVMetadataObjectTypeQRCode,
                                      AVMetadataObjectTypeAztecCode
                                      ];
        
        //        _output.rectOfInterest = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
        
        // Preview
        _preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
        _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
        _preview.frame = self.view.bounds;
        [self.view.layer insertSublayer:self.preview atIndex:0];
    }
    
    // Start
    [_session startRunning];
}


- (void)addAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.fromValue = [NSNumber numberWithFloat:5];
    animation.toValue = [NSNumber numberWithFloat:(K_SCREEN_WIDTH - 20 * 2) - 13];
    animation.duration = 2;
    animation.repeatCount = FLT_MAX;
    animation.autoreverses = YES;
    [_line.layer addAnimation:animation forKey:ANIMATION_KEY];
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
        _content4QRCode = stringValue;
    }
    
    [_session stopRunning];
    [_line.layer removeAnimationForKey:ANIMATION_KEY];
    
    if ([_content4QRCode hasPrefix:@"http"]) {
        //
        //  Other QR Code Operation
        //
        UIAlertView *tmpAlert = [[UIAlertView alloc] initWithTitle:@"是否打开链接" message:self.content4QRCode delegate:self cancelButtonTitle:nil otherButtonTitles:@"取消",@"打开", nil];
        tmpAlert.tag = AlertTypeOpenURL;
        [tmpAlert show];
    } else {
        
        WXLogInfo(@"qr>>>>>>>>>>>>>>>%@",_content4QRCode);
        
        if (self.callback) {
            
            NSDictionary *resultData = [NSDictionary configCallbackDataWithResCode:BMResCodeSuccess msg:nil data:@{@"text": _content4QRCode}];
            
            /* 将扫码结果回传给js */
            if (self.callback) {
                self.callback(resultData);
                self.callback = nil;
            }
            
        }
        
        [self.navigationController popViewControllerAnimated:YES];
        return;
        
    }
    
    
}


#pragma mark -  UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == AlertTypeNoAuthorization) {
        if (buttonIndex == 1) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (K_SYSTEM_VERSION > 8.0) {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                } else {
                    NSURL *privacyUrl;
                    if (alertView.tag == 1) {
                        privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=PHOTOS"];
                    } else {
                        privacyUrl = [NSURL URLWithString:@"prefs:root=Privacy&path=CAMERA"];
                    }
                    if ([[UIApplication sharedApplication] canOpenURL:privacyUrl]) {
                        [[UIApplication sharedApplication] openURL:privacyUrl];
                    } else {
                        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"抱歉" message:@"无法跳转到隐私设置页面，请手动前往设置页面，谢谢" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                        [alert show];
                    }
                }
            });
        }
        [self.navigationController popViewControllerAnimated:YES];
        return;
    } else if (alertView.tag == AlertTypeOpenURL) {
        if (buttonIndex == 1) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_content4QRCode]];
            });
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    
    //
    //  Carry on 2 Scan
    //
    // Start
    [_session startRunning];
    
    [self addAnimation];
}


@end
