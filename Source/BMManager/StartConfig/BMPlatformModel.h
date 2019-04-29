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
@property (nonatomic, copy) NSString *statusBarStyle;   /**< 状态栏文字颜色 */
@end

@interface BMPlatformModelUrl : NSObject
@property (nonatomic, copy) NSString *request;              /**< 数据请求url */
@property (nonatomic, copy) NSString *jsServer;             /**< js文件服务器url */
@property (nonatomic, copy) NSString *image;                /**< 图片上传接口url */
@property (nonatomic, copy) NSString *bundleUpdate;         /**< 检查js版本接口 注：不需要请求的域名 */
@property (nonatomic, copy) NSString *socketServer;         /**< 热刷新sockert地址 */

@end

@interface BMPlatformModelGetui : NSObject
@property (nonatomic, assign) BOOL enabled;             /**< 是否启用个推推送服务 */
@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *appKey;
@property (nonatomic, copy) NSString *appSecret;
@end

@interface BMTabBarItem : NSObject
@property (nonatomic, copy) NSString *pagePath; /**< 页面路径 */
@property (nonatomic, copy) NSString *text; /**< 标题 */
@property (nonatomic, copy) NSString *icon; /**< 图标 */
@property (nonatomic, copy) NSString *selectedIcon; /**< 选择图标 */
@property (nonatomic, assign) BOOL navShow; /**< 是否显示原生导航栏 */
@property (nonatomic, copy) NSString *navTitle; /**< 导航栏标题 */
@end

@interface BMPlatformModelTabBar : NSObject
@property (nonatomic, assign) CGFloat height; /**< 高度 */
@property (nonatomic, copy) NSString *color; /**< 文字颜色 */
@property (nonatomic, copy) NSString *selectedColor; /**< 选中文字颜色 */
@property (nonatomic, copy) NSString *backgroundColor; /**< 背景颜色 */
@property (nonatomic, copy) NSString *borderColor; /**< 上边栏颜色 */
@property (nonatomic, strong) NSArray *list; /**< items */
@end

@interface BMPlatformModel : NSObject
@property (nonatomic, copy) NSString *appName; /**< appName 检测js更新时需要传给后端判断那哪个app */
@property (nonatomic, copy) NSString *appBoard; /**< native端需要注入的js代码路径 */
@property (nonatomic, assign) BOOL customBundleUpdate; /**< 用户自定义jsbundle更新逻辑，为 true 时不走默认的更新逻辑 */
@property (nonatomic, strong) BMPlatformModelPage *page;
@property (nonatomic, strong) BMPlatformModelUrl *url;
@property (nonatomic, strong) BMPlatformModelGetui *getui;
@property (nonatomic, strong) BMPlatformModelTabBar *tabBar;
@end
