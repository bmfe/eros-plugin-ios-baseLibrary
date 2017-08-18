//
//  BMRouterModel.h
//  WeexDemo
//
//  Created by XHY on 2017/1/16.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>
#import <WeexSDK/WXModuleProtocol.h>

@interface NavigationInfo : NSObject
@property (nonatomic, copy) NSString *title;        // NavigationTitle
@property (nonatomic, assign) BOOL hideNavbar;      // 是否隐藏native端导航栏
@property (nonatomic, copy) NSString *statusBarStyle;   // Default:黑色 LightContent:白色
@end

@interface BMRouterModel : NSObject

@property (nonatomic, copy) NSString *animateType;              // 页面出现方式：push ， present
@property (nonatomic, copy) NSString *url;                      // 下一个页面路径
@property (nonatomic, strong) NavigationInfo *navigationInfo;   // 导航栏信息
@property (nonatomic, strong) NSDictionary *params;             // 需要传到下一个页面的数据
@property (nonatomic, assign) NSInteger vLength;                // 页面返回多少级
@property (nonatomic, assign) BOOL forbidBack;                  // 是否禁止手势返回 true 禁止
@property (nonatomic, assign) BOOL needBackCallback;            // 点击返回按钮时是否响应callback方法 true 时回调下面的callback
@property (nonatomic, copy) WXModuleCallback backCallback;      // 点击返回时的回调方法


@property (nonatomic,copy)NSString * pageName;                  //页面名 可以用作Router 更易读
@end
