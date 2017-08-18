//
//  BMAxiosRequestModel.h
//  WeexDemo
//
//  Created by XHY on 2017/1/13.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface BMAxiosRequestModel : NSObject

@property (nonatomic, copy) NSString *method;               // 请求类型 GET or POST
@property (nonatomic, copy) NSString *url;                  // 请求路径
@property (nonatomic, strong) NSDictionary *header;         // 请求头
@property (nonatomic, strong) NSMutableDictionary *data;    // 请求参数
@property (nonatomic, strong) NSDictionary *params;         // post 请求 url 添加参数
@property (nonatomic, assign) BOOL noRepeat;                // 请求是否允许重复，默认是 false，如果为 true，发现队列中有类似请求需要 cancel 掉

@end
