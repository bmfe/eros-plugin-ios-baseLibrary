//
//  WXSDKInstance+BMExtend.m
//  BM-JYT
//
//  Created by XHY on 2017/3/29.
//  Copyright © 2017年 XHY. All rights reserved.
//

#import "WXSDKInstance+BMExtend.h"
#import <objc/runtime.h>
#import "BMNotifactionCenter.h"
#import "BMResourceManager.h"

@implementation WXSDKInstance(BMExtend)


- (void)bm_destroyInstance
{
    //通知消息中心 移除对应实例
    [[BMNotifactionCenter defaultCenter] destroyObserver:self.instanceId];
    
    [self bm_destroyInstance];
    
}


- (void)bm__renderWithMainBundleString:(NSString *)mainBundleString
{
    /** 注入本地公共的 base js */
    NSString *baseScript = [BMResourceManager sharedInstance].bmWidgetJs;
    
    if (baseScript.length) {
        mainBundleString = [baseScript stringByAppendingString:mainBundleString];
    }
    
    [self bm__renderWithMainBundleString:mainBundleString];
}

@end
