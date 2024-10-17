//
//  SwizzleLoader.m
//  ModeDetectionUITests
//
//  Created by fraune on 10/17/24.
//

#import <XCTest/XCTest.h>
#import <objc/runtime.h>

@implementation XCUIApplication (Swizzle)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(launch);
        SEL swizzledSelector = @selector(swizzledLaunch);

        Method originalMethod = class_getInstanceMethod(self, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);

        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

- (void)swizzledLaunch {
    // Create a mutable copy of launchEnvironment
    NSMutableDictionary *mutableEnv = [self.launchEnvironment mutableCopy];
    
    // Set the environment variable on the mutable copy
    mutableEnv[@"UI_Test"] = @"true";
    
    // Reassign the modified environment to the app's launchEnvironment
    self.launchEnvironment = mutableEnv;

    // Call the original launch (which is now `swizzledLaunch`)
    [self swizzledLaunch];
}

@end
