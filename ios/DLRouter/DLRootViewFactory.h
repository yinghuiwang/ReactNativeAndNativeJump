//
//  DLRootViewFactory.h
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/15.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "DLRouterManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface DLRootViewFactory : NSObject

+ (UIView *)getRootViewWithNavigateType:(NSString *)navigateType screenName:(NSString *)screenName navigateParams:(NSDictionary *)navigateParams;
+ (UIView *)getRootView;

@end

NS_ASSUME_NONNULL_END
