//
//  BMBrowserImageViewController.h
//  BM-JYT
//
//  Created by 窦静轩 on 2017/3/31.
//  Copyright © 2017年 XHY. All rights reserved.
//

#import "BMBaseViewController.h"

@interface BMBrowserImageViewController : UIViewController

@property (nonatomic,assign)NSUInteger index;

@property (nonatomic,strong)NSArray * images;

@property (nonatomic,strong)NSArray * netAddress;

@property (nonatomic,assign)BOOL isLocal;

-(void)show;

@end
