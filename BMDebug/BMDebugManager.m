//
//  BMDebugWindow.m
//  BM-JYT
//
//  Created by 窦静轩 on 2017/3/10.
//  Copyright © 2017年 XHY. All rights reserved.
//

#ifdef DEBUG
#import "BMDebugManager.h"
#import "BMDragButton+Debug.h"
#import "UIWindow+Util.h"


@interface BMDebugManager ()
{
    BMDragButton * _debugButton;
}
@end


@implementation BMDebugManager


+ (instancetype)shareInstance
{
    static BMDebugManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[BMDebugManager alloc] init];
    });
    return _instance;
}

// 显示
- (void)show
{
    UIWindow *window = [UIWindow findVisibleWindow];
    if (nil == _debugButton) {
        _debugButton = [BMDragButton debugButton];
    }
    
    NSArray * views = [window subviews];
    if (NO == [views containsObject:_debugButton]) {
        [window addSubview:_debugButton];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [window bringSubviewToFront:_debugButton];
    });
    
}
// 消失
- (void)dismiss
{
    [_debugButton removeFromSuperview];
}
@end
#endif
