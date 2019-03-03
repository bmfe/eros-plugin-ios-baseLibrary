//
//  BMDragButton+Debug.m
//  BM-JYT
//
//  Created by 窦静轩 on 2017/3/10.
//  Copyright © 2017年 XHY. All rights reserved.
//

#ifdef DEBUG
#import "BMDragButton+Debug.h"
#import "DebugSettingVC.h"
#import "BMBaseViewController.h"
#import "BMMediatorManager.h"
#import <UIKit/UIKit.h>
#import "BMResourceManager.h"
#import "Masonry.h"
#import "BMNavigationController.h"
#import <WXDevtool/WXDevTool.h>
#import "WXScannerVC.h"
#import "BMDebugManager.h"


@interface BMDragButton()

@end


@implementation BMDragButton(Debug)

- (void)dealloc
{
    self.controller = nil;
}

+ (instancetype)debugButton
{
    CGRect rect  = [UIScreen mainScreen].bounds;
    
    CGRect frame = CGRectMake(10, CGRectGetHeight(rect) - 140, 80, 60);
    
    BMDragButton *btn = [[BMDragButton alloc] initWithFrame:frame];
    btn.backgroundColor = [UIColor blackColor];
    btn.alpha = 0.6;
    UILabel *lbl = [[UILabel alloc] init];
    lbl.textColor = K_WHITE_COLOR;
    lbl.text = @"Debug";
    lbl.font = K_FONT_14;
    btn.layer.cornerRadius = 8;
    [btn addSubview:lbl];
    
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(btn);
    }];
    
    [btn setDragEnable:YES];
    [btn setAdsorbEnable:YES];
    
    UITapGestureRecognizer *oneTap = [[UITapGestureRecognizer alloc] initWithTarget:btn action:@selector(showDebug)];
    [btn addGestureRecognizer:oneTap];
    
    UITapGestureRecognizer *twoTap = [[UITapGestureRecognizer alloc] initWithTarget:btn action:@selector(refreshWeex)];
    twoTap.numberOfTapsRequired = 2;
    twoTap.numberOfTouchesRequired = 1;
    [btn addGestureRecognizer:twoTap];
    
    [oneTap requireGestureRecognizerToFail:twoTap];
    
    return btn;
}

- (void)showDebug
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"Eros debugger" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *set = [UIAlertAction actionWithTitle:@"Setting" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        BMNavigationController * nav = [[BMNavigationController alloc] initWithRootViewController:[[DebugSettingVC alloc] init]];
        UIViewController* controller =  [[BMMediatorManager shareInstance] currentViewController];
        [controller presentViewController:nav animated:YES completion:nil];
    }];
    UIAlertAction *refresh = [UIAlertAction actionWithTitle:@"Refresh" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //刷新
        [self refreshWeex];
    }];
    UIAlertAction *debug = [UIAlertAction actionWithTitle:@"Scan" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (TARGET_IPHONE_SIMULATOR) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"模拟器不支持此项功能，请使用真机调试" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:ok];
            UIViewController* controller =  [[BMMediatorManager shareInstance] currentViewController];
            [controller presentViewController:alert animated:YES completion:nil];
            return;
        }
        //扫一扫调试
        WXScannerVC *scanVc = [[WXScannerVC alloc] init];
        [[BMMediatorManager shareInstance].currentViewController.navigationController pushViewController:scanVc animated:YES];
        //            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"开始调试之前请确保您已正确配置‘debugUrl’并已开启‘weex debug’调试窗口" preferredStyle:UIAlertControllerStyleAlert];
        //            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        //            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Debug" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //                [WXDevTool launchDevToolDebugWithUrl:TK_PlatformInfo().url.debugServer];
        //            }];
        //            [alert addAction:cancel];
        //            [alert addAction:ok];
        //            [[BMMediatorManager shareInstance].currentViewController presentViewController:alert animated:YES completion:nil];
    }];
    
    [alert addAction:cancel];
    [alert addAction:set];
    [alert addAction:refresh];
    [alert addAction:debug];
    
    UIViewController* topVC =  [[BMMediatorManager shareInstance] currentViewController];
    
    // 修复iPad崩溃问题
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        alert.popoverPresentationController.sourceView = self;
        alert.popoverPresentationController.sourceRect = self.bounds;
    }
    [topVC presentViewController:alert animated:YES completion:nil];
    
}

- (void)refreshWeex
{
    [[BMDebugManager shareInstance] refreshWeex];
}
@end
#endif
