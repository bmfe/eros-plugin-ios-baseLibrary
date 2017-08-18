//
//  BMBaseViewController.h
//  WeexDemo
//
//  Created by XHY on 2017/1/12.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SRWebSocket.h>
#import "BMRouterModel.h"
#import "BMCommonRequest.h"

@interface BMBaseViewController : UIViewController<SRWebSocketDelegate>

@property (nonatomic, strong) NSString *script;
@property (nonatomic, strong) NSURL *url;

@property (nonatomic, strong) BMRouterModel *routerModel;   // 页面导航信息


@property (nonatomic, strong) SRWebSocket *hotReloadSocket;
@property (nonatomic, strong) NSString *source;

/* 刷新weex页面 */
- (void)refreshWeex;

/* 属于此页面的请求 请调用此方法来将请求的引用添加给此页面，在页面执行viewDidAppear方法时会cancel掉请求 */
- (void)addRequest:(BMCommonRequest *)request;

@end
