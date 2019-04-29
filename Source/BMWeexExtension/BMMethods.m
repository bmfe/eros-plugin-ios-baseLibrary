//
//  BMMethods.m
//  BM-JYT
//
//  Created by XHY on 2017/3/8.
//  Copyright © 2017年 XHY. All rights reserved.
//

#import "BMMethods.h"

#import "NSObject+BMSwizzle.h"

#import <WeexSDK/WeexSDK.h>
#import <WeexSDK/WXRuleManager.h>

#import "WXBridgeManager+BMExtend.h"

#import "BMAddRuleManager.h"
#import "WXTextComponent+BMExtend.h"
#import "WXScrollerComponent+BMExtend.h"
#import "WXListComponent+BMExtend.h"
#import "WXRecyclerComponent+BMExtend.h"

#import <WeexSDK/WXTextInputComponent.h>
#import "WXImageComponent+BMExtend.h"
#import "BMGetEnvironment.h"
#import "WXSDKInstance+BMExtend.h"
#import <WXEditComponent+BMExtend.h>
#import <WXSDKEngine+BMExtend.h>
#import <WXWebComponent+BMExtend.h>
#import "BMDefine.h"


@implementation BMMethods

+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //设置默认字体为 默认
        NSString * currentFontSize = [[NSUserDefaults standardUserDefaults] valueForKey:K_FONT_SIZE_KEY];
        if (nil == currentFontSize) {
            [[NSUserDefaults standardUserDefaults] setObject:K_FONT_SIZE_NORM forKey:K_FONT_SIZE_KEY];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }

        
        [[self class] exchangeWeexDefault];
        [[self class] exchangeWeexAddRule];
        [[self class] exchangeWeexEditComponent];
        [[self class] exchangeWeexTextComponent];
        [[self class] exchangeWeexScrollerComponent];
        [[self class] exchangeWXWebComponent];
//        [[self class] exchangeRecyclerComponent];
        
        [[self class] exchangeWeexImageComponent];
    
        [[self class] exchangeWeexGetEnvironment];

        [[self class] exchangeSDKInstance];
        
        [[self class] exchangeWXBridgeManager];

    });
}


+ (void)exchangeWeexDefault
{
    [self bm_swizzleClassMethod:[WXSDKEngine class] Method:@selector(_registerDefaultHandlers) withMethod:@selector(bm_registerDefaultHandlers)];
}

+ (void)exchangeWeexAddRule
{
    /** 获取原始addRule方法 */
    Method originalM = class_getInstanceMethod([WXRuleManager class], @selector(addRule:rule:));
    
    /** 获取自定义的addRule方法 */
    Method exchangeM = class_getClassMethod([BMAddRuleManager class], @selector(addRule:rule:));
    
    /** 交换方法 */
    method_exchangeImplementations(originalM, exchangeM);
}

+ (void)exchangeWeexEditComponent
{
    [self bm_swizzle:[WXEditComponent class] Method:@selector(setAutofocus:) withMethod:@selector(bmEdit_setAutofocus:)];
    [self bm_swizzle:[WXEditComponent class] Method:@selector(initWithRef:type:styles:attributes:events:weexInstance:) withMethod:@selector(bmEdit_initWithRef:type:styles:attributes:events:weexInstance:)];
    [self bm_swizzle:[WXEditComponent class] Method:@selector(viewDidLoad) withMethod:@selector(bmEdit_viewDidLoad)];
}

+ (void)exchangeWeexTextComponent
{
    [self bm_swizzle:[WXTextComponent class] Method:@selector(initWithRef:type:styles:attributes:events:weexInstance:) withMethod:@selector(bmText_initWithRef:type:styles:attributes:events:weexInstance:)];
}

+ (void)exchangeWeexScrollerComponent
{
    [self bm_swizzle:[WXScrollerComponent class] Method:@selector(initWithRef:type:styles:attributes:events:weexInstance:) withMethod:@selector(bmScroller_initWithRef:type:styles:attributes:events:weexInstance:)];
    [self bm_swizzle:[WXScrollerComponent class] Method:@selector(scrollViewDidScroll:) withMethod:@selector(bmScroller_scrollViewDidScroll:)];
    [self bm_swizzle:[WXScrollerComponent class] Method:@selector(loadView) withMethod:@selector(bmScroller_loadView)];
    [self bm_swizzle:[WXScrollerComponent class] Method:@selector(updateAttributes:) withMethod:@selector(bmScroller_updateAttributes:)];
    
    /** 替换 WXListComponent 的 loadView 方法 */
    Method originalM4 = class_getInstanceMethod([WXListComponent class], @selector(loadView));
    Method exchangeM4 = class_getInstanceMethod([WXScrollerComponent class], @selector(bmList_loadView));
    method_exchangeImplementations(originalM4, exchangeM4);
    
    /** 替换 WXScrollerComponent 的 viewDidLoad 方法 */
    [self bm_swizzle:[WXScrollerComponent class] Method:@selector(viewDidLoad) withMethod:@selector(bmScroller_viewDidLoad)];
}


+(void)exchangeWeexImageComponent
{
    /* 替换 WXImageComponent 的 updatePlaceHolderWithFailedBlock 方法 */
    [self bm_swizzle:[WXImageComponent class] Method:@selector(updatePlaceHolderWithFailedBlock:) withMethod:@selector(bm_updatePlaceHolderWithFailedBlock:)];
    [self bm_swizzle:[WXImageComponent class] Method:@selector(updateContentImageWithFailedBlock:) withMethod:@selector(bm_updateContentImageWithFailedBlock:)];
}

+(void)exchangeWeexGetEnvironment
{
    /** 获取原始_registerDefaultHandlers方法 */
    Method originalM = class_getClassMethod([WXUtility class], @selector(getEnvironment));
    
    /** 获取自定义的bm_registerDefaultHandlers方法 */
    Method exchangeM = class_getClassMethod([BMGetEnvironment class], @selector(bm_getEnvironment));
    
    /** 交换方法 */
    method_exchangeImplementations(originalM, exchangeM);
}
+(void)exchangeSDKInstance
{
    [self bm_swizzle:[WXSDKInstance class] Method:@selector(destroyInstance) withMethod:@selector(bm_destroyInstance)];
    [self bm_swizzle:[WXSDKInstance class] Method:@selector(_renderWithMainBundleString:) withMethod:@selector(bm__renderWithMainBundleString:)];
}
+ (void)exchangeWXBridgeManager
{
    /* 替换 WXBridgeManager 的fire方法 */
    [self bm_swizzle:[WXBridgeManager class] Method:@selector(fireEvent:ref:type:params:domChanges:) withMethod:@selector(bm_fireEvent:ref:type:params:domChanges:)];
}

+ (void)exchangeWXWebComponent
{
    /* 替换 WXBridgeManager 的fire方法 */
    [self bm_swizzle:[WXWebComponent class] Method:@selector(webViewDidFinishLoad:) withMethod:@selector(bm_webViewDidFinishLoad:)];
    
    /* 替换 WXWebComponent 的viewDidLoad方法 */
    [self bm_swizzle:[WXWebComponent class] Method:@selector(viewDidLoad) withMethod:@selector(bm_viewDidLoad)];
    
    /* 替换 WXWebComponent 的setUrl方法 */
    [self bm_swizzle:[WXWebComponent class] Method:@selector(setUrl:) withMethod:@selector(bm_setUrl:)];
    
    /* 替换 WXWebComponent 的loadURL 方法*/
    [self bm_swizzle:[WXWebComponent class] Method:@selector(loadURL:) withMethod:@selector(bm_loadURL:)];
}

+ (void)exchangeRecyclerComponent
{
    /* 替换 WXRecyclerComponent 的loadView方法 */
    [self bm_swizzle:[WXRecyclerComponent class] Method:@selector(loadView) withMethod:@selector(bmRecycler_loadView)];
}

@end
