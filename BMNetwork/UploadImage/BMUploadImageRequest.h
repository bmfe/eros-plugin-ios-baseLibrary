//
//  BMUploadImageRequest.h
//  WeexDemo
//
//  Created by XHY on 2017/2/10.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMBaseRequest.h"
#import <UIKit/UIKit.h>

@interface BMUploadImageRequest : BMBaseRequest

- (instancetype)initWithImage:(UIImage *)image params:(id)params;

@property (nonatomic,strong)UIImage * image;

@end
