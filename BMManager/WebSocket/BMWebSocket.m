//
//  BMWebSocket.m
//  Pods
//
//  Created by XHY on 2017/9/13.
//
//

#import "BMWebSocket.h"
#import "SRWebSocket.h"

@interface BMWebSocket () <SRWebSocketDelegate>

@property (nonatomic, strong) SRWebSocket *webSocket;

@end

@implementation BMWebSocket

+ (void)connectServer:(NSURL *)URL
{
    [[[self class] shareInstance] _connectServer:URL];
}


+ (instancetype)shareInstance
{
    static BMWebSocket *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[BMWebSocket alloc] init];
    });
    
    return _instance;
}

- (void)_connectServer:(NSURL *)URL
{
    _webSocket = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:URL]];
    _webSocket.delegate = self;
    
    [_webSocket open];
}

#pragma mark - SRWebSocketDelegate

- (void)webSocketDidOpen:(SRWebSocket *)webSocket;
{
    WXLogWarning(@"Websocket Connected:%@", webSocket.url);
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error;
{
    WXLogError(@":( Websocket Failed With Error %@", error);
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message;
{
    WXLog(@"Websocket didReceiveMessage: %@",message);
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean
{
    WXLogInfo(@"Websocket closed with code: %ld, reason:%@, wasClean: %d", (long)code, reason, wasClean);
}


@end
