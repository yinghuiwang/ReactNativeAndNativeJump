//
//  DLRouterManager.m
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/14.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "DLRouterManager.h"
#import "DLRouterJump.h"

@interface DLRouterManager ()

@property (nonatomic, strong) DLRouterJump *routerJump;

@end

@implementation DLRouterManager

+ (instancetype)sharedInstance {
  return [[self alloc] init];
}


+ (instancetype)allocWithZone:(struct _NSZone *)zone {
  static DLRouterManager *instance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [super allocWithZone:zone];
  });
  return instance;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    self.bridgeRouter = [[DLRouterBridge alloc] init];
    __weak DLRouterManager *weakSelf = self;
    [self.bridgeRouter addListenerWithNavigate:^(NSString *navigateType, NSString *screen, NSDictionary *params) {
      __strong DLRouterManager *strongSelf = weakSelf;
      if ([navigateType isEqualToString:kNavigateTypePop]) {
        [strongSelf.routerJump popWithParams:params];
      } else if([navigateType isEqualToString:kNavigateTypePush]) {
        [strongSelf.routerJump push:screen params:params];
      }
    }];
    
    [self.bridgeRouter addListenerSwitchRightDrawPop:^(Boolean enabled) {
      __strong DLRouterManager *strongSelf = weakSelf;
      [strongSelf.routerJump switchRightDrawPopEnabled:enabled];
    }];
  
  }
  return self;
}

- (void)registerRootViewController:(UIViewController *)viewController {
  DLRouterJump *routerJump = [[DLRouterJump alloc] init];
  [routerJump registerRootViewController:viewController];
  self.routerJump = routerJump;
}

- (void)navigate:(NSString *)navigateType screenName:(NSString *)screenName params:(NSDictionary *)params {
  [self.bridgeRouter sendRouterEventWithParams:@{kParamNavigateType: navigateType, kParamScreenName: screenName, kParamNavigateParams: params}];
}

- (void)navigate:(NSString *)navigateType screenName:(NSString *)screenName params:(NSDictionary *)params finish:(NavigationCompletedCallback) callback {
  [self.bridgeRouter sendRouterEventWithParams:@{kParamNavigateType: navigateType, kParamScreenName: screenName, kParamNavigateParams: params}];
  
  [self.bridgeRouter addListenerNavigationCompleted:callback];
}


@end
