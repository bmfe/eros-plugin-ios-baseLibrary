//
//  BMWebViewRouterModel.h
//  Pods
//
//  Created by XHY on 2017/7/19.
//
//

#import <Foundation/Foundation.h>

@interface BMWebViewRouterModel : NSObject

@property (nonatomic, copy) NSString *url;              /**< url */
@property (nonatomic, copy) NSString *title;            /**< 页面标题 */
@property (nonatomic, assign) BOOL navShow;             /**< 是否隐藏导航栏 */
@property (nonatomic, copy) NSString *backgroundColor;  /**< 页面背景颜色 */

@end
