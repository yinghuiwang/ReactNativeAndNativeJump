//
//  DLRouterJump.m
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/16.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "DLRouterJump.h"
#import <objc/runtime.h>
#import "DLRNViewController.h"

@interface DLRouterJump ()

@property (nonatomic, weak) UIViewController *rootVC;

@end

@implementation DLRouterJump



- (void)registerRootViewController:(UIViewController *)viewController {
  _rootVC = viewController;
}

- (UINavigationController *)getCurrentNavigationController {
  if (self.rootVC == nil || ![self.rootVC isKindOfClass:[UITabBarController class]]) {
    return nil;
  }
  UITabBarController *rootTabBarController = (UITabBarController *)self.rootVC;
  return rootTabBarController.selectedViewController;
}


- (void)push:(NSString *)screen params: (NSDictionary *)params {
  NSObject *navigateTarget = [self getTarget:screen params:params];
  if (navigateTarget == nil || ![navigateTarget isKindOfClass:[UIViewController class]]) {
    return;
  }
  UIViewController *navigateTargetVC = (UIViewController *)navigateTarget;
  if ([self getCurrentNavigationController]) {
    [[self getCurrentNavigationController] pushViewController:navigateTargetVC animated:YES];
  }
}

- (void)popWithParams: (NSDictionary *)params {
  UIViewController *topVC = [self getCurrentNavigationController].topViewController;
  if ([topVC isKindOfClass:[DLRNViewController class]] ) {
    [[self getCurrentNavigationController] popViewControllerAnimated:YES];
  }
}


- (NSObject *)getTarget:(NSString *)targetName params: (NSDictionary *)params
{
  Class targetClass = NSClassFromString(targetName);
  NSObject *target = [[targetClass alloc] init];
  if (target == nil) {
    return nil;
  }
  
  if (params != nil) {
    [self setValueWithInstance:target dict:params];
  }
  
  return target;
}


- (void)setValueWithInstance:(NSObject *)instance dict:(NSDictionary *)dict {
  
  if (dict == nil) {
    return;
  }
  //(1)获取类的属性及属性对应的类型
  NSMutableArray * keys = [NSMutableArray array];
  NSMutableArray * attributes = [NSMutableArray array];
 
  unsigned int outCount;
  objc_property_t * properties = class_copyPropertyList([instance class], &outCount);
  for (int i = 0; i < outCount; i ++) {
    objc_property_t property = properties[i];
    NSString * propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
    [keys addObject:propertyName];
    NSString * propertyAttribute = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
    [attributes addObject:propertyAttribute];
  }
  //立即释放properties指向的内存
  free(properties);
  
  for (NSString * key in keys) {
    if ([dict valueForKey:key] == nil) continue;
    [instance setValue:[dict valueForKey:key] forKey:key];
  }
}


/**
 设置右划pop是否激活
 
 @param enabled 是否激活
 */
- (void)switchRightDrawPopEnabled:(Boolean) enabled {
  [[self getCurrentNavigationController].interactivePopGestureRecognizer setEnabled:enabled];
}
@end
