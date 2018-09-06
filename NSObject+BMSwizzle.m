//
//  NSObject+BMSwizzle.m
//  BMBaseLibrary
//
//  Created by XHY on 2018/9/6.
//

#import "NSObject+BMSwizzle.h"

@implementation NSObject (BMSwizzle)

+ (BOOL)bm_swizzle:(Class)originalClass Method:(SEL)originalSelector withMethod:(SEL)swizzledSelector
{
    if (!(originalClass && originalSelector && swizzledSelector)) {
        return NO;
    }
    
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(originalClass, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(originalClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
    return YES;
}

@end
