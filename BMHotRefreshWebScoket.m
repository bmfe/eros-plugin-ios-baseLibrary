//
//  BMHotRefreshWebScoket.m
//  BMBaseLibrary
//
//  Created by XHY on 2018/3/15.
//

#ifdef DEBUG
#import "BMHotRefreshWebScoket.h"
#import "BMWebSocketLoader.h"
#import "BMDebugManager.h"

#define BM_HOT_REFRESH @"SERVER/JS_BUNDLE_CHANGED"

@implementation BMHotRefreshWebScoket
{
    BMWebSocketLoader *loader;
}

- (void)connect
{
    NSURL *url = [NSURL URLWithString:TK_PlatformInfo().url.jsServer];
    if (!url) {
        WXLogError(@"BMHotRefresh WebSocket Server URL Error");
        return;
    }
    
    NSString *portUrl = [NSString stringWithFormat:@"ws://%@:8890",url.host];
//    portUrl = @"ws://192.168.15.240:8890";
    [self webSocket:portUrl protocol:nil];
}

- (void)close
{
    if (loader) {
        [loader close];
    }
}

- (void)webSocket:(NSString *)url protocol:(NSString *)protocol
{
    if(loader)
    {
        [loader clear];
    }
    loader = [[BMWebSocketLoader alloc] initWithUrl:url protocol:protocol];
    __weak typeof(self) weakSelf = self;
    loader.onReceiveMessage = ^(id message) {
        WXLogInfo(@"%@",message);
        if ([message isEqualToString:BM_HOT_REFRESH]) {
            [[BMDebugManager shareInstance] refreshWeex];
        }
    };
    loader.onOpen = ^() {
        WXLogInfo(@"BMHotRefresh Websocket connected");
    };
    loader.onFail = ^(NSError *error) {
        WXLogError(@"BMHotRefresh Websocket Failed With Error %@", error);
        if (weakSelf) {
            [weakSelf connect];
        }
    };
    loader.onClose = ^(NSInteger code,NSString *reason,BOOL wasClean) {
        WXLogInfo(@"BMHotRefresh Websocket colse: %@", reason);
        if (weakSelf) {
            [weakSelf connect];
        }
    };
    
    [loader open];
}

@end

#endif
