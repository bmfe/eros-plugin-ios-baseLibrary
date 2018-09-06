//
//  NSObject+BMSwizzle.h
//  BMBaseLibrary
//
//  Created by XHY on 2018/9/6.
//

#import <Foundation/Foundation.h>

@interface NSObject (BMSwizzle)

+ (BOOL)bm_swizzle:(Class)originalClass Method:(SEL)originalSelector withMethod:(SEL)swizzledSelector;

@end
