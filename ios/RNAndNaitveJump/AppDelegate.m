/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"
#import "YHTabbarViewController.h"
#import "DLRouterManager.h"

@interface AppDelegate ()<UITabBarControllerDelegate>

@end
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  YHTabbarViewController *nav = [[YHTabbarViewController alloc] init];
  nav.delegate = self;
  self.window.rootViewController = nav;
  [self.window makeKeyAndVisible];
  return YES;
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
  
  

 if ([viewController isMemberOfClass:[UINavigationController class]]) {
   UINavigationController *nav = (UINavigationController *)viewController;
   if ([nav.viewControllers[0] isKindOfClass:[DLRNViewController class]]) {
     DLRNViewController *vc = (DLRNViewController *)nav.viewControllers[0];
     [[DLRouterManager sharedInstance] navigate:kNavigateTypeNavigate screenName:vc.screenName params:@{}];
   } else {
     [DLRootViewFactory getRootViewWithNavigateType:kNavigateTypeNavigate screenName:@"Home" navigateParams:@{}];
   }
  }
  
  return true;
}

@end
