//
//  DLRNViewController.m
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/21.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "DLRNViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "DLRouterManager.h"
#import "DLRootViewFactory.h"
#import <React/RCTLog.h>

@interface DLRNViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic, assign) Boolean rnRenderCompleted;

@end

@implementation DLRNViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear: animated];
  [self.navigationController setNavigationBarHidden:YES];
  
  if (self.rnRenderCompleted) {
    [self.view addSubview:[DLRootViewFactory getRootView]];
  }
  
}

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
  
  // 解决右滑返回失效问题
  self.navigationController.interactivePopGestureRecognizer.delegate = self;
  [self.navigationController.interactivePopGestureRecognizer setEnabled:true];
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [DLRootViewFactory getRootViewWithNavigateType:kNavigateTypePush screenName:self.screenName navigateParams:self.navigateParams];
  __weak DLRNViewController *weakSelf = self;
  
  [[DLRouterManager sharedInstance].bridgeRouter addListenerNavigationCompleted:^(NSString *routeName, Boolean isTransitioning) {
    __strong DLRNViewController *strongSelf = weakSelf;
    if (!isTransitioning) {
      [strongSelf.view addSubview:[DLRootViewFactory getRootView]];
      strongSelf.rnRenderCompleted = YES;
    }
  }];
  
  self.view.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc {
  if (self.fromScreenName) {
    [[DLRouterManager sharedInstance] navigate:kNavigateTypeNavigate screenName:self.fromScreenName params:@{}];
  }
}
@end
