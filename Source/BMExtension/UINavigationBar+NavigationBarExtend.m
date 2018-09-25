//
//  UINavigationBar+NavigationBarExtend.m
//  WeexDemo
//
//  Created by XHY on 2017/1/13.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "UINavigationBar+NavigationBarExtend.h"
#import <objc/runtime.h>

@implementation UINavigationBar (NavigationBarExtend)

- (void)ex_setBackgroundColor:(UIColor *)color
{
    [self setBackgroundImage:[UIImage imageWithColor:color size:self.size] forBarMetrics:UIBarMetricsDefault];
}

@end
