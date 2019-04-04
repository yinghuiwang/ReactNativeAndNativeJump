//
//  YHTestViewController.m
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/15.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "YHTestViewController.h"
#import "RNLevel2ViewController.h"
#import "DLRootViewFactory.h"

@interface YHTestViewController ()<UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSString *privateTest1;
@property (nonatomic, strong) NSString *privateTest2;
@property (nonatomic, strong) NSString *privateTest3;
@property (nonatomic, strong) NSString *privateTest4;

@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, assign) int i;

@end

@implementation YHTestViewController

- (void)viewWillAppear:(BOOL)animated {
   [super viewWillAppear:animated];
   [self.navigationController setNavigationBarHidden:NO];
  
  // 解决右滑返回失效问题
  self.navigationController.interactivePopGestureRecognizer.delegate = self;
  [self.navigationController.interactivePopGestureRecognizer setEnabled:true];
  
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.dataArray = @[@"Doc", @"HeaderSetting", @"Details"];
  self.i = 0;
  UILabel *label = [[UILabel alloc] init];
  label.text = @"原生YHTestViewController";
  label.frame = CGRectMake(100, 200, 200, 200);
  [self.view addSubview:label];
  
  UIButton *btn = [[UIButton alloc] init];
  btn.frame = CGRectMake(100, 400, 100, 50);
  btn.backgroundColor = [UIColor blackColor];
  [btn setTitle:@"to RN" forState:UIControlStateNormal];
  [btn addTarget:self action:@selector(goRn) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:btn];
}

- (void)goRn {
  
//  NSString *screenName = self.dataArray[(self.i ++)%3];
  NSString *screenName = self.dataArray[2];
  
  RNLevel2ViewController *rnOneVC = [[RNLevel2ViewController alloc] init];
  rnOneVC.screenName = screenName;
  rnOneVC.fromScreenName = self.fromScreenName;
  rnOneVC.navigateParams = @{@"hideTransition": @(YES), @"isGoNative": @(YES), @"gesturesInvalid": @(YES) };
  [self.navigationController pushViewController:rnOneVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
