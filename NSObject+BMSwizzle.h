//
//  NSObject+BMSwizzle.h
//  BMBaseLibrary
//
//  Created by XHY on 2018/9/6.
//

#import <Foundation/Foundation.h>

@interface NSObject (BMSwizzle)


/**
 交互实例方法
 注：新方法必须通过类别实现
 @param originalClass 类
 @param originalSelector 原方法
 @param swizzledSelector 交换方法
 @return YES/NO
 */
+ (BOOL)bm_swizzle:(Class)originalClass Method:(SEL)originalSelector withMethod:(SEL)swizzledSelector;


/**
 交互类方法
 注：新方法必须通过类别实现

 @param originalClass 类
 @param originalSelector 原方法
 @param swizzledSelector 交互方法
 @return YES/NO
 */
+ (BOOL)bm_swizzleClassMethod:(Class)originalClass Method:(SEL)originalSelector withMethod:(SEL)swizzledSelector;

@end
