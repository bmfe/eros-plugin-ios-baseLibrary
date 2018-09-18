//
//  BMResourceManager.h
//  BM-JYT
//
//  Created by XHY on 2017/3/10.
//  Copyright © 2017年 XHY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BMJSVersionModel;

typedef void(^BMUpdateBundleJsBlock)(BOOL success, NSString *msg);

@interface BMResourceManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic,strong)BMJSVersionModel * model;
@property (nonatomic,copy) NSString *bmWidgetJs; /**< 前端封装的widgets需要native端拼接到每个js文件之前 */

-(void)checkNewVersion:(BOOL)isDiff;

-(NSDictionary*)loadConfigData:(NSString*)configPath;

/** 比较工程中、cache、当前加载的js版本，应用最新的资源文件 */
-(void)compareVersion;

/** 下载jsbundle 资源 */
-(void)downloadJsBundle:(NSDictionary *)info completed:(BMUpdateBundleJsBlock)completedBlock;

@end
