//
//  BMWebViewController.h
//  BM-JYT
//
//  Created by XHY on 2017/2/28.
//  Copyright © 2017年 XHY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMShareModel.h"
#import "BMWebViewRouterModel.h"

#define K_NO_CONTENT @"暂无内容，详情请见官网"

@interface BMWebViewController : UIViewController

@property (nonatomic, strong) BMWebViewRouterModel *routerInfo;

@end
