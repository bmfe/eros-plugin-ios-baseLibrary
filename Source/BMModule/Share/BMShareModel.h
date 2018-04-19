//
//  BMShareModel.h
//  BM-JYT
//
//  Created by XHY on 2017/2/27.
//  Copyright © 2017年 XHY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYModel.h"

typedef NS_ENUM(NSInteger,BMSharePlatformType) {
    BMSharePlatformType_Sina = 0,
    BMSharePlatformType_WechatSession,
    BMSharePlatformType_WechatTimeLine,
    BMSharePlatformType_WechatFavorite,
    BMSharePlatformType_QQ,
    BMSharePlatformType_Qzone,
    
    BMSharePlatformType_Pasteboard = 1001,
    BMSharePlatformType_FontSize = 1002
};

#define K_SharePlatformSina                 @"Sina"
#define K_SharePlatformWechatSession        @"WechatSession"
#define K_SharePlatformWechatTimeLine       @"WechatTimeLine"
#define K_SharePlatformWechatFavorite       @"WechatFavorite"
#define K_SharePlatformQQ                   @"QQ"
#define K_SharePlatformQzone                @"Qzone"
#define K_SharePlatformPasteboard           @"Pasteboard"
#define K_SharePlatformFontSize             @"FontSize"

/** 分享类型 */
typedef NS_ENUM(NSInteger,BMShareType) {
    BMShareTypeText,
    BMShareTypeImage,
    BMShareTypeTextImage,
    BMShareTypeWebpage,
    BMShareTypeMusic,
    BMShareTypeVideo,
    BMShareTypeMiniProgram
};

#define K_ShareTypeText                     @"Text"
#define K_ShareTypeImage                    @"Image"
#define K_ShareTypeTextImage                @"TextImage"
#define K_ShareTypeWebpage                  @"Webpage"
#define K_ShareTypeMusic                    @"Music"
#define K_ShareTypeVideo                    @"Video"
#define K_ShareTypeMiniProgram              @"MiniProgram"

@interface BMShareModel : NSObject

@property (nonatomic, copy) NSString *image;                    /**< 分享的图片url */
@property (nonatomic, copy) NSString *title;                    /**< 分享的标题 */
@property (nonatomic, copy) NSString *content;                  /**< 分享的文字内容 */
@property (nonatomic, copy) NSString *url;                      /**< 分享web页面对应的地址 */
@property (nonatomic, copy) NSString *path;                     /**< 分享小程序用到的页面路径 */
@property (nonatomic, assign) BMSharePlatformType platform;     /**< 分享的平台 */
@property (nonatomic, assign) BMShareType shareType;            /**< 分享的类型 */

@end
