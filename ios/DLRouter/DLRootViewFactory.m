//
//  DLRootViewFactory.m
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/15.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "DLRootViewFactory.h"
#import <React/RCTLinkingManager.h>

@interface DLRootViewFactory ()


@end

@implementation DLRootViewFactory

static UIView *rootView = nil;
+ (UIView *)getRootViewWithNavigateType:(NSString *)navigateType screenName:(NSString *)screenName navigateParams:(NSDictionary *)navigateParams {
  if (rootView == nil) {
    NSURL *jsCodeLocation;
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
    
    NSDictionary *props = @{kParamNavigateType: navigateType,
                            kParamScreenName: screenName,
                            kParamNavigateParams: navigateParams};
    rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                           moduleName:@"A0131_RNToNaitve"
                                    initialProperties:props
                                        launchOptions:nil];
    [rootView setFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    rootView.backgroundColor = [UIColor blackColor];
  } else {
    [[DLRouterManager sharedInstance] navigate:navigateType screenName:screenName params:navigateParams];
  }
  return rootView;
}

+ (UIView *)getRootView {
  return rootView;
}

@end
