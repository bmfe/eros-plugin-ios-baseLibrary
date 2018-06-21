//
//  BMTabbarModule.m
//  BMBaseLibrary
//
//  Created by XHY on 2018/6/21.
//

#import "BMTabbarModule.h"
#import <WeexPluginLoader/WeexPluginLoader.h>
#import "UITabBar+Badge.h"
#import "BMMediatorManager.h"

WX_PlUGIN_EXPORT_MODULE(bmTabbar, BMTabbarModule)

@implementation BMTabbarModule

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(showBadge:))
WX_EXPORT_METHOD(@selector(hideBadge:))
WX_EXPORT_METHOD(@selector(openPage:))

- (void)showBadge:(NSDictionary *)info
{
    int index = info[@"index"] ? [info[@"index"] intValue] : 0;
    NSString *value = info[@"value"];
    UIColor *textColor = info[@"textColor"] ? [UIColor colorWithHexString:info[@"textColor"]] : [UIColor whiteColor];
    UIColor *backgroundColor = info[@"bgColor"] ? [UIColor colorWithHexString:info[@"bgColor"]] : [UIColor redColor];
    
    [[BMMediatorManager shareInstance].baseTabBarController.tabBar showBadgeOnItenIndex:index
                                                                                  value:value
                                                                        backgroundColor:backgroundColor
                                                                              textColor:textColor];
}
- (void)hideBadge:(NSDictionary *)info
{
    int index = info[@"index"] ? [info[@"index"] intValue] : 0;
    
    [[BMMediatorManager shareInstance].baseTabBarController.tabBar hideBadgeOnItenIndex:index];
}

- (void)openPage:(NSDictionary *)info
{
    NSInteger index = info[@"index"] ? [info[@"index"] integerValue] : 0;
    [[BMMediatorManager shareInstance] backToHomeIndex:index];
}

@end
