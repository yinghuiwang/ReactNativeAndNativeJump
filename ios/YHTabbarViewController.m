//
//  YHTabbarViewController.m
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/15.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "YHTabbarViewController.h"
#import "OrgOneViewController.h"
#import "RNTestViewController.h"
#import "DLRouterManager.h"

// 屏幕底部 tabBar高度49pt + 安全视图高度34pt(iPhone X)
#define TabbarHeight self.tabBar.frame.size.height

@interface YHTabbarViewController ()
@property(nonatomic, strong) NSMutableArray *vcContainer;
@end

@implementation YHTabbarViewController
- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
  [super viewDidDisappear:animated];
}

- (instancetype)init {
  self = [super init];
  if (self) {
    self.vcContainer = [[NSMutableArray alloc] init];
    
    OrgOneViewController *home = [[OrgOneViewController alloc] init];
    [self registerViewController:home title:@"主页" systemItem:UITabBarSystemItemMore];
    
    RNTestViewController *test1 = [[RNTestViewController alloc] init];
    test1.screenName = @"MainTab";
    test1.navigateParams = @{};
    [self registerViewController:test1 title:@"RNPate1" systemItem:UITabBarSystemItemHistory];
    
    RNTestViewController *test2 = [[RNTestViewController alloc] init];
    test2.screenName = @"SettingsTab";
    test2.navigateParams = @{};
    [self registerViewController:test2 title:@"RNPate2" systemItem:UITabBarSystemItemRecents];
    
    RNTestViewController *test3 = [[RNTestViewController alloc] init];
    test3.screenName = @"CategoryScreen";
    test3.navigateParams = @{};
    [self registerViewController:test3 title:@"RNPate3" systemItem:UITabBarSystemItemSearch];
    
    [self setViewControllers:[self.vcContainer copy]];
    
    
    [[DLRouterManager sharedInstance] registerRootViewController:self];
    [DLRootViewFactory getRootViewWithNavigateType:kNavigateTypeNavigate screenName:@"Home" navigateParams:@{}];
    __weak YHTabbarViewController *weakSelf = self;
    [[DLRouterManager sharedInstance].bridgeRouter addListenerHideBottomBar:^(Boolean hidden) {
      __strong YHTabbarViewController *strongSelf = weakSelf;
      if (hidden) {
        [strongSelf hideTabbarAnimatd];
      } else {
        [strongSelf showTabbarAnimatd];
      }
    }];
    
  }
  return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)registerViewController:(UIViewController *)vc title:(NSString *)title systemItem:(UITabBarSystemItem)systemItem {
  UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:vc];
  vc.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:systemItem tag:1];
  vc.title = title;
  [self.vcContainer addObject:navigationController];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)hideTabbarAnimatd {
  CGFloat tabBarY = [[UIScreen mainScreen] bounds].size.height;
  if (self.tabBar.frame.size.height == tabBarY) {
    return;
  }
  
  [UIView animateWithDuration:0.3 animations:^{
    self.tabBar.frame = CGRectMake(0, tabBarY,  [[UIScreen mainScreen] bounds].size.width, TabbarHeight);
  }];
}

- (void)showTabbarAnimatd {
  CGFloat tabBarY = [[UIScreen mainScreen] bounds].size.height - TabbarHeight;
  if (self.tabBar.frame.size.height == tabBarY) {
    return;
  }
    [UIView animateWithDuration:0.3 animations:^{
      self.tabBar.frame = CGRectMake(0, tabBarY,  [[UIScreen mainScreen] bounds].size.width, TabbarHeight);
    }];
}
@end
