//
//  BMHandlerFactory.h
//  BMBaseLibrary
//
//  Created by XHY on 2018/6/28.
//

#import <Foundation/Foundation.h>

@interface BMHandlerFactory : NSObject

+ (void)registerHandler:(id)handler withProtocol:(Protocol *)protocol;

+ (id)handlerForProtocol:(Protocol *)protocol;

+ (NSDictionary *)handlerConfigs;

@end
