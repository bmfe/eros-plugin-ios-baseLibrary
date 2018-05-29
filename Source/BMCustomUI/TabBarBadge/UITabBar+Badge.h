//
//  UITabBar+Badge.h
//  BMBaseLibrary
//
//  Created by XHY on 2018/5/29.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

- (void)showBadgeOnItenIndex:(int)index value:(NSString *)value;
- (void)hideBadgeOnItenIndex:(int)index;
@end
