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
#import "WXScannerVC.h"
#import "BMMediatorManager.h"
#import <UIKit/UIKit.h>
#import "BMResourceManager.h"

@interface BMDragButton()<UIActionSheetDelegate>

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
    [btn setTitle:@"调试" forState:UIControlStateNormal];
    UIFont *font = [UIFont systemFontOfSize:14.0];
    btn.titleLabel.font = font;
    btn.layer.cornerRadius = 8;
    
    [btn setDragEnable:YES];
    [btn setAdsorbEnable:YES];
    
    [btn addTarget:btn action:@selector(showDebug:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

-(void)show
{
    NSArray * windows = [[UIApplication sharedApplication] windows];
    WXLogDebug(@"windows is %@",windows);
    
    UIWindow * keyWindow = [[UIApplication sharedApplication] keyWindow];
    
    WXLogDebug(@"keyWindow is %@",keyWindow);
    
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    [[[UIApplication sharedApplication] keyWindow] bringSubviewToFront:self];
}

- (void)showDebug:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"设置项",@"刷新",@"扫一扫",
                                  nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    
    
    UIViewController* topVC =  [[BMMediatorManager shareInstance] currentViewController];
    [actionSheet showInView:topVC.view];
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:[[DebugSettingVC alloc] init]];
            
            UIViewController* controller =  [[BMMediatorManager shareInstance] currentViewController];
            
            
            [controller presentViewController:nav animated:YES completion:nil];
        }
            break;
        case 1:
        {
            /** 刷新widgetJs */
            [BMResourceManager sharedInstance].bmWidgetJs = nil;
            /** 刷新jsMediator */
//            [[BMMediatorManager shareInstance].jsMediator refreshWeex];
            
            UIViewController* controller =  [[BMMediatorManager shareInstance] currentViewController];

            if ([controller isKindOfClass:[BMBaseViewController class]]) {
                [(BMBaseViewController*)controller refreshWeex];
            }
            
        }
            break;

        case 2:
        {
            #if TARGET_IPHONE_SIMULATOR//模拟器
                UIAlertView * av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"仅支持真机" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil,nil];
                [av show];
            #elif TARGET_OS_IPHONE//真机
                UIViewController* controller =  [[BMMediatorManager shareInstance] currentViewController];
            
                if ([controller isKindOfClass:[BMBaseViewController class]]) {
                    WXScannerVC * scanViewController = [[WXScannerVC alloc] init];
                    [controller.navigationController pushViewController:scanViewController animated:YES];
                }

            #endif
            
     }
            break;

            
        default:
            break;
    }
}
@end
#endif
