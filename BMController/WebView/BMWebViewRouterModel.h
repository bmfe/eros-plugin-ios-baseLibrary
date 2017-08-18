//
//  BMWebViewRouterModel.h
//  Pods
//
//  Created by XHY on 2017/7/19.
//
//

#import <Foundation/Foundation.h>
#import "BMShareModel.h"

@interface BMWebViewRouterModel : NSObject

@property (nonatomic, copy) NSString *url;              /**< url */
@property (nonatomic, copy) NSString *title;            /**< 页面标题 */
@property (nonatomic, assign) BOOL authorize;           /**< 是否需要授权，为 true 则在url后面拼接token */
@property (nonatomic, assign) BOOL hideNavbar;          /**< 是否隐藏导航栏 */
@property (nonatomic, copy) BMShareModel *shareModel;   /**< 分享model */

@end
