//
//  DLBridgeRouter.h
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/14.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const kRouterEvent;
extern NSString * const kNavigateTypePush;
extern NSString * const kNavigateTypePop;
extern NSString * const kNavigateTypeReset;
extern NSString * const kParamNavigateType;
extern NSString * const kParamScreenName;
extern NSString * const kParamNavigateParams;
extern NSString * const kNavigateTypeNavigate;
extern NSString * const kNavigateTypeReplace;
extern NSString * const kParamNavigateHideTransition;
extern NSString * const kParamNavigateGesturesInvalid;
extern NSString * const kParamNavigateIsGoNative;

typedef void (^NavigateCallback)(NSString *navigateType, NSString *screen, NSDictionary * param);
typedef void (^SwitchRightDrawPopCallback)(Boolean enabled);
typedef void (^HideBottomBarCallback)(Boolean hidden);
typedef void (^NavigationCompletedCallback)(NSString *routeName, Boolean isTransitioning);

@interface DLRouterBridge : RCTEventEmitter <RCTBridgeModule>

- (void)sendRouterEventWithParams: (NSDictionary *)params;

- (void)addListenerWithNavigate:(NavigateCallback) callback;
- (void)addListenerSwitchRightDrawPop:(SwitchRightDrawPopCallback) callBack;
- (void)addListenerNavigationCompleted:(NavigationCompletedCallback) callBack;
- (void)addListenerHideBottomBar:(HideBottomBarCallback) callBack;
@end

NS_ASSUME_NONNULL_END
