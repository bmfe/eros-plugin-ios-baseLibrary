//
//  BMPlatformModel.h
//  Pods
//
//  Created by XHY on 2017/8/15.
//
//

#import <Foundation/Foundation.h>

@interface BMPlatformModelPage : NSObject
@property (nonatomic, copy) NSString *homePage;         /**< 首页js路径 */
@property (nonatomic, copy) NSString *mediatorPage;     /**< 中介者页面js路径 */
@property (nonatomic, copy) NSString *navBarColor;      /**< 导航栏默认颜色 */
@property (nonatomic, copy) NSString *navItemColor;     /**< 导航栏item颜色 */
@end

@interface BMPlatformModelUrl : NSObject
@property (nonatomic, copy) NSString *request;          /**< 数据请求url */
@property (nonatomic, copy) NSString *jsServer;         /**< js文件服务器url */
@property (nonatomic, copy) NSString *image;            /**< 图片上传接口url */
@property (nonatomic, copy) NSString *updateVersion;    /**< 检查js版本接口 注：不需要请求的域名 */
@end

@interface BMPlatformModelGetui : NSObject
@property (nonatomic, assign) BOOL enabled;             /**< 是否启用个推推送服务 */
@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *appKey;
@property (nonatomic, copy) NSString *appSecret;
@end

@interface BMPlatformModelUmeng : NSObject
@property (nonatomic, assign) BOOL enabled;             /**< 是否启用友盟服务 */
@property (nonatomic, copy) NSString *iOSAppKey;        /**< 友盟appKey */
@end

@interface BMPlatformModelWechat : NSObject
@property (nonatomic, assign) BOOL enabled;             /**< 是否使用微信功能 */
@property (nonatomic, copy) NSString *appId;            /**< 微信appid */
@property (nonatomic, copy) NSString *appSecret;
@end

@interface BMPlatformModelAmap : NSObject
@property (nonatomic, assign) BOOL enabled;             /**< 是否启用高德地图 */
@property (nonatomic, copy) NSString *iOSAppKey;        /**< appkey */
@end

@interface BMPlatformModelWidget : NSObject
@property (nonatomic,copy) NSString *path;              /**< widget路径 */
@end

@interface BMPlatformModel : NSObject
@property (nonatomic, copy) NSString *appName;          /**< appName 检测js更新时需要传给后端判断那哪个app */
@property (nonatomic, strong) BMPlatformModelPage *page;
@property (nonatomic, strong) BMPlatformModelUrl *url;
@property (nonatomic, strong) BMPlatformModelGetui *getui;
@property (nonatomic, strong) BMPlatformModelUmeng *umeng;
@property (nonatomic, strong) BMPlatformModelWechat *wechat;
@property (nonatomic, strong) BMPlatformModelAmap *amap;
@property (nonatomic, strong) BMPlatformModelWidget *widget;
@end
