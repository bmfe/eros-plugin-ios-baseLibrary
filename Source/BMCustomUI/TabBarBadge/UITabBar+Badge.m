//
//  UITabBar+Badge.m
//  BMBaseLibrary
//
//  Created by XHY on 2018/5/29.
//

#import "UITabBar+Badge.h"

#define K_BadgeViewTag 1200

@implementation UITabBar (Badge)

- (void)showBadgeOnItenIndex:(int)index value:(NSString *)value backgroundColor:(UIColor *)bgColor textColor:(UIColor *)textColor
{
    [self hideBadgeOnItenIndex:index];

    UIView *badgeView = [[UIView alloc] init];
    badgeView.userInteractionEnabled = YES;
    badgeView.tag = K_BadgeViewTag + index;
    badgeView.backgroundColor = bgColor ?: [UIColor redColor];
    
    float width = 8;
    if (value) {
        width = 15;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, width)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = textColor ?: [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:10];
        label.text = [NSString stringWithFormat:@"%@",value];
        label.userInteractionEnabled = YES;
        [badgeView addSubview:label];
    }
    
    float percentX = (index + 0.55) / self.items.count;
    CGFloat x = ceilf(percentX * self.frame.size.width);
    CGFloat y = ceilf(0.1 * self.frame.size.height);
    badgeView.frame = CGRectMake(x, y, width, width);
    badgeView.layer.cornerRadius = width / 2.0;
    [self addSubview:badgeView];
    [self bringSubviewToFront:badgeView];
}

- (void)hideBadgeOnItenIndex:(int)index
{
    for (UIView *subView in self.subviews) {
        if (subView.tag == K_BadgeViewTag + index) {
            [subView removeFromSuperview];
        }
    }
}

@end
