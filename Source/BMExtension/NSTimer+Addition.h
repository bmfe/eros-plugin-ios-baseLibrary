//
//  NSTimer+Addition.h
//  JingYitong
//
//  Created by XHY on 15/8/13.
//  Copyright (c) 2015年 XHY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)

- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
