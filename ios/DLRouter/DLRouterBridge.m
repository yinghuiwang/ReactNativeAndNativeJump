//
//  DLBridgeRonter.m
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/14.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "DLRouterBridge.h"
#import <React/RCTLog.h>

NSString * const kRouterEvent = @"ROUTER_EVENT";

NSString * const kNavigateTypeReset = @"NAVIGATE_TYPE_RESET";
NSString * const kNavigateTypePush = @"NAVIGATE_TYPE_PUSH";
NSString * const kNavigateTypeNavigate = @"NAVIGATE_TYPE_NAVIGATE";
NSString * const kNavigateTypeReplace = @"NAVIGATE_TYPE_REPLACE";
NSString * const kNavigateTypePop = @"NAVIGATE_TYPE_POP";


NSString * const kParamNavigateType = @"navigateType";
NSString * const kParamScreenName = @"screenName";
NSString * const kParamNavigateParams = @"params";
NSString * const kParamNavigateHideTransition = @"hideTransition"; // 转场动画隐藏（Boolean）
NSString * const kParamNavigateGesturesInvalid = @"gesturesInvalid"; // 进入的页面禁用右划POP手势（Boolean）
NSString * const kParamNavigateIsGoNative = @"isGoNative"; // 返回原生标识（Boolean）


@interface DLRouterBridge ()

@property (nonatomic, strong) NavigateCallback navigateCallback;
@property (nonatomic, strong) SwitchRightDrawPopCallback switchRightDrawPopEnabel;
@property (nonatomic, strong) NavigationCompletedCallback navigationCompletedCallback;
@property (nonatomic, strong) HideBottomBarCallback hideBottomBarCallback;

@end

@implementation DLRouterBridge

RCT_EXPORT_MODULE();

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup {
  return YES;
}

+ (id)allocWithZone:(NSZone *)zone {
  static DLRouterBridge *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [super allocWithZone:zone];
  });
  return instance;
}

- (NSArray<NSString *> *)supportedEvents
{
  return @[kRouterEvent];
}

- (void)sendRouterEventWithParams: (NSDictionary *)params {
  [self sendEventWithName:kRouterEvent body:params];
}

- (void)addListenerWithNavigate:(NavigateCallback)callback {
  self.navigateCallback = callback;
}

- (void)addListenerSwitchRightDrawPop:(SwitchRightDrawPopCallback)callBack {
  self.switchRightDrawPopEnabel = callBack;
}

- (void)addListenerNavigationCompleted:(NavigationCompletedCallback)callBack {
  self.navigationCompletedCallback = callBack;
}

- (void)addListenerHideBottomBar:(HideBottomBarCallback)callBack {
  self.hideBottomBarCallback = callBack;
}

RCT_EXPORT_METHOD(navigate:(NSString *)navigateType screenName:(NSString *)screenName param:(NSDictionary *)param)
{
  if (self.navigateCallback) {
    self.navigateCallback(navigateType, screenName, param);
  }
}

RCT_EXPORT_METHOD(pop)
{
  if (self.navigateCallback) {
    self.navigateCallback(kNavigateTypePop, nil, nil);
  }
}

RCT_EXPORT_METHOD(setRightDrawPopEnabled:(BOOL)enabled)
{
  if (self.switchRightDrawPopEnabel) {
    self.switchRightDrawPopEnabel(enabled);
  }
}


RCT_EXPORT_METHOD(navigationCompleted:(NSString *) routeName transitioning:(BOOL) isTransitioning)
{
  if (self.navigationCompletedCallback) {
    self.navigationCompletedCallback(routeName, isTransitioning);
    if (!isTransitioning) {
      self.navigationCompletedCallback = nil;
    }
  }
}

RCT_EXPORT_METHOD(hideBottomBar:(BOOL) hidden)
{
  if (self.hideBottomBarCallback) {
    self.hideBottomBarCallback(hidden);
  }
}

- (NSDictionary *)constantsToExport
{
  return @{
           kRouterEvent: kRouterEvent,
           kNavigateTypePush: kNavigateTypePush,
           kNavigateTypePop: kNavigateTypePop,
           kNavigateTypeReset: kNavigateTypeReset,
           kNavigateTypeNavigate: kNavigateTypeNavigate,
           kNavigateTypeReplace: kNavigateTypeReplace
           };
}

@end
