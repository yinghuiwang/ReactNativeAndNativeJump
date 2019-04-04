//
//  DLRouterManager.h
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/14.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DLRouterBridge.h"
#import "DLRootViewFactory.h"
#import "DLRNViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DLRouterManager : NSObject

@property(nonatomic, strong) DLRouterBridge *bridgeRouter;

+ (instancetype)sharedInstance;

/**
 注册根控制器

 @param viewController 注册tabbarController/navigationController
 */
- (void)registerRootViewController:(UIViewController *)viewController;

- (void)navigate:(NSString *)navigateType screenName:(NSString *)screenName params:(NSDictionary *)params;

/**
 导航方法

 @param navigateType 跳转类型：NAVIGATE_TYPE_POP/NAVIGATE_TYPE_PUSH/...
 @param screenName 导航名字
 @param params 页面参数
 @param callback 导航完成回调
 */
- (void)navigate:(NSString *)navigateType screenName:(NSString *)screenName params:(NSDictionary *)params finish:(NavigationCompletedCallback)callback;

@end

NS_ASSUME_NONNULL_END
