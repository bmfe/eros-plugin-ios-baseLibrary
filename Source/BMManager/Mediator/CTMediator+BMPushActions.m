//
//  CTMediator+BMPushActions.m
//  BMBaseLibrary
//
//  Created by XHY on 2018/4/24.
//

#import "CTMediator+BMPushActions.h"

NSString *const kCTMediatorPushTarget = @"BMPush";

NSString *const kCTMediatorActionRegisterDeviceToken = @"registerForRemoteNotificationsWithDeviceToken";
NSString *const kCTMediatorActionSetIsLaunchedByNotification = @"setIsLaunchedByNotification";
NSString *const kCTMediatorActionAddPushNotification = @"addPushNotification";
NSString *const kCTMediatorActionReceiveRemoteNotification = @"receiveRemoteNotification";
NSString *const kCTMediatorActionPerformFetchWithCompletionHandler = @"performFetchWithCompletionHandler";

@implementation CTMediator (BMPushActions)

- (void)CTMediator_registerForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [self performTarget:kCTMediatorPushTarget
                 action:kCTMediatorActionRegisterDeviceToken
                 params:deviceToken
      shouldCacheTarget:NO];
}

- (void)CTMediator_setIsLaunchedByNotification:(BOOL)val
{
    [self performTarget:kCTMediatorPushTarget
                 action:kCTMediatorActionSetIsLaunchedByNotification
                 params:[NSNumber numberWithBool:val]
      shouldCacheTarget:NO];
}

- (void)CTMediator_addPushNotification:(NSDictionary *)notificationPayload
{
    [self performTarget:kCTMediatorPushTarget
                 action:kCTMediatorActionAddPushNotification
                 params:notificationPayload
      shouldCacheTarget:NO];
}

- (void)CTMediator_receiveRemoteNotification:(NSDictionary *)info
{
    [self performTarget:kCTMediatorPushTarget
                 action:kCTMediatorActionReceiveRemoteNotification
                 params:info
      shouldCacheTarget:NO];
}

- (void)CTMediator_performFetchWithCompletionHandler:(NSDictionary *)info
{
    [self performTarget:kCTMediatorPushTarget
                 action:kCTMediatorActionPerformFetchWithCompletionHandler
                 params:info
      shouldCacheTarget:NO];
}

@end
