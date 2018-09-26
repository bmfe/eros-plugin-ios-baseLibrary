//
//  BMRouterManager.m
//  Pods
//
//  Created by 窦静轩 on 2017/4/26.
//
//

#import "BMRouterManager.h"
#import "NSString+Util.h"
#import "NSObject+YYModel.h"
#import "BMRouterModel.h"
#import "BMMediatorManager.h"
#import "BMBaseViewController.h"
#import "BMAppResource.h"
#import "BMDefine.h"
#import <BMConfigManager.h>


static NSString * schemeKey = @"weexeros";

static NSString * openPageKey = @"openpage";

static NSString * openTabKey = @"opentab";

static NSString * oauthKey = @"oauth";

@implementation BMRouterManager

+(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSString * scheme = url.scheme;
    NSString * host = url.host;
    
    if ([scheme isEqualToString:schemeKey]) {
        /* openPage */
        if ([[host lowercaseString] isEqualToString:openPageKey]) {
            return [[self class] openPage:url];
        }
        
        /* openTab */
        else if ([[host lowercaseString] isEqualToString:openTabKey]) {
            return [[self class] openTab:url];
        }
        
    }
    
    return NO;
}

#pragma mark openPage
+(BOOL)openPage:(NSURL*)url
{
    NSString * query = url.query;
    NSString * decodeQuery = [query decodeString];
    NSLog(@"decodeQuery is %@",decodeQuery);
    
    NSDictionary * decodeInfo = [decodeQuery dictionaryFromQuery];
    NSDictionary * info = decodeInfo[@"data"];
    
    
    BMRouterModel *routerModel = [BMRouterModel yy_modelWithJSON:info];
    
    if ([routerModel isKindOfClass:[BMRouterModel class]]) {
        
        BMMediatorManager * mediatorManager =  [BMMediatorManager shareInstance];
    
        
        //如果最顶端应该是BMBaseViewController
        if ([mediatorManager.currentViewController isKindOfClass:[BMBaseViewController class]]) {
            
            //完整的URL
            NSURL * toUrl = [BMAppResource configJSFullURLWithPath:routerModel.url];
            
            //如果两者相等,则刷新当前页
            if ([[toUrl absoluteString] isEqualToString:[[(BMBaseViewController*)mediatorManager.currentViewController url] absoluteString]]) {
                [(BMBaseViewController*)mediatorManager.currentViewController refreshWeex];
            }
            else{
                /* 通过中介者跳转页面 */
                
                [mediatorManager openViewControllerWithRouterModel:routerModel weexInstance:mediatorManager.currentWXInstance];
            }
        }
    }
    return YES;
}
+(BOOL)openTab:(NSURL*)url
{
    NSString * query = url.query;
    NSString * decodeQuery = [query decodeString];
    NSLog(@"decodeQuery is %@",decodeQuery);
    
    NSDictionary * decodeInfo = [decodeQuery dictionaryFromQuery];

    
    NSNumber *  index = decodeInfo[@"index"];
    
    if (index) {
         BMMediatorManager * mediatorManager =  [BMMediatorManager shareInstance];
        [mediatorManager backToHomeIndex:[index intValue]];
    }

    return YES;
}


@end
