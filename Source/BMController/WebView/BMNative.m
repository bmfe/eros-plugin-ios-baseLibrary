//
//  BMNative.m
//  BMBaseLibrary
//
//  Created by XHY on 2018/7/2.
//

#import "BMNative.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "BMMediatorManager.h"
#import "BMNotifactionCenter.h"

@protocol BMJSExport <JSExport>

- (void)closePage;
- (void)fireEvent:(NSString *)event :(id)info;

@end

@interface BMNative () <BMJSExport>

@end

@implementation BMNative

- (void)dealloc
{
    WXLogInfo(@"BMNative dealloc");
}

- (void)closePage {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[BMMediatorManager shareInstance].currentViewController.navigationController popViewControllerAnimated:YES];
        [[BMMediatorManager shareInstance].currentViewController dismissViewControllerAnimated:YES completion:nil];
    });
}

- (void)fireEvent:(NSString *)event :(id)info {
    [[BMNotifactionCenter defaultCenter] emit:event info:info];
}

@end
