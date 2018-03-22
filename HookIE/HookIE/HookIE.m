//  HookIE.m
//  HookIE
//
//  Created by in8 on 2018/3/22.
//  Copyright © 2018年 in8. All rights reserved.
//

#import "HookIE.h"
#import <objc/runtime.h>

void exchangeInstanceMethod(Class class, SEL originalSelector, SEL newSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method newMethod = class_getInstanceMethod(class, newSelector);
    method_exchangeImplementations(originalMethod, newMethod);
}

void exchangeClassMethod(Class class, SEL originalSelector, SEL newSelector) {
    Method originalMethod = class_getClassMethod(class, originalSelector);
    Method newMethod = class_getClassMethod(class, newSelector);
    method_exchangeImplementations(originalMethod, newMethod);
}

static void __attribute__((constructor)) initialize(void) {
    @autoreleasepool {
        exchangeClassMethod(NSClassFromString(@"IERegistrationManager"), NSSelectorFromString(@"figureOutKeyType:"), NSSelectorFromString(@"zjfigureOutKeyType:"));
    }
}

@implementation NSObject (some)
- (int)zjfigureOutKeyType:(id)arg1 {
    return 1;
}
@end

