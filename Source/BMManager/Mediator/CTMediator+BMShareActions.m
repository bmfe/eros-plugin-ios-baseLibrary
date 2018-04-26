//
//  CTMediator+BMShareActions.m
//  Pods
//
//  Created by XHY on 2018/4/25.
//

#import "CTMediator+BMShareActions.h"

NSString *const kCTMediatorWXShareTarget = @"BMWXShare";

NSString *const kCTMediatorActionHandleOpenURL = @"ShareHandleOpenURL";

@implementation CTMediator (BMShareActions)

- (BOOL)CTMediator_ShareHandleOpenURL:(NSDictionary *)info
{
    id result = [self performTarget:kCTMediatorWXShareTarget
                 action:kCTMediatorActionHandleOpenURL
                 params:info
      shouldCacheTarget:NO];
    return [result boolValue];
}

@end
