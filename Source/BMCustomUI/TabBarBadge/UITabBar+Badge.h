//
//  UITabBar+Badge.h
//  BMBaseLibrary
//
//  Created by XHY on 2018/5/29.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

- (void)showBadgeOnItenIndex:(int)index value:(NSString *)value backgroundColor:(UIColor *)bgColor textColor:(UIColor *)textColor;
- (void)hideBadgeOnItenIndex:(int)index;
@end
