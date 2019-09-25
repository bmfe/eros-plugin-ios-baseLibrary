//
//  BMBaseViewController+Order.m
//  Pods
//
//  Created by XHY on 2017/5/22.
//
//

#import "BMBaseViewController+Order.h"
#import "BMConfigManager.h"

@implementation BMBaseViewController (Order)

- (BOOL)currentVcIs:(NSString *)url
{
    return ![url isEqualToString:@"tabBar"] && [self.url.absoluteString rangeOfString:url].location != NSNotFound;
}

/* 判断是否隐藏导航栏 */
- (BOOL)isHideNavbar
{
    if (!self.routerModel.navShow ||
        [self currentVcIs:[BMConfigManager shareInstance].platform.page.homePage]) {
        
        return YES;
    }
    
    return NO;
}

/* 设置状态栏样式 */
- (void)bmSetStatusBarStyle
{
    if (!self.routerModel.statusBarStyle) {
        if ([BMConfigManager.shareInstance.platform.page.statusBarStyle isEqualToString:@"LightContent"]) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
        } else {
            if (@available(iOS 13.0, *)) {
                [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDarkContent animated:NO];
            } else {
                [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
            }
        }
        return;
    }
    
    /* 设置状态栏 字体颜色 */
    if ([self.routerModel.statusBarStyle isEqualToString:@"Default"]) {
        if (@available(iOS 13.0, *)) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDarkContent animated:NO];
        }else {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
        }
        
    } else {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    }
}

- (CGFloat)weexViewHeight
{
    /* 设置weex页面高度 */
    CGFloat height = self.view.height;
    if (self.routerModel.isTabBarItem) {
        height -= K_TABBAR_HEIGHT;
    }
    
    return height;
}

@end
