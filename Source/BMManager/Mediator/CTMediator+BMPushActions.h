//
//  CTMediator+BMPushActions.h
//  BMBaseLibrary
//
//  Created by XHY on 2018/4/24.
//
// BMPush 事件中介者

#import "CTMediator.h"

@interface CTMediator (BMPushActions)

- (void)CTMediator_registerForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
- (void)CTMediator_setIsLaunchedByNotification:(BOOL)val;
- (void)CTMediator_addPushNotification:(NSDictionary *)notificationPayload;
- (void)CTMediator_receiveRemoteNotification:(NSDictionary *)info;
- (void)CTMediator_performFetchWithCompletionHandler:(NSDictionary *)info;

@end
