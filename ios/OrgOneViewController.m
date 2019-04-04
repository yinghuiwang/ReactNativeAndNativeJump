//
//  OrgOneViewController.m
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 1/31/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "OrgOneViewController.h"
#import "RNLevel2ViewController.h"
#import "DLRouterManager.h"
#import "RNLevel2ViewController.h"
#import <React/RCTLog.h>

NSString * const kCellId = @"OrgOneViewControllerCell";

@interface OrgOneViewController ()<UITableViewDelegate, UITableViewDataSource>
{
  UIButton *pushBtn;
  Boolean isOne;
}

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation OrgOneViewController

- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];
  
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear: animated];
  [self.navigationController setNavigationBarHidden:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
  self.dataArray = @[@"Doc", @"HeaderSetting", @"Details"];
    // Do any additional setup after loading the view.
  self.view.backgroundColor = [UIColor whiteColor];
  UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)
                                                        style:UITableViewStylePlain];
  tableView.delegate = self;
  tableView.dataSource = self;
  [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellId];
  [self.view addSubview:tableView];
  self.tableView = tableView;
  
  self.title = @"原生控制器One";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellId];
  cell.textLabel.text = self.dataArray[indexPath.row];
  return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *screenName = self.dataArray[indexPath.row];
  RNLevel2ViewController *rnOneVC = [[RNLevel2ViewController alloc] init];
  rnOneVC.screenName = screenName;
  rnOneVC.fromScreenName = @"Home";
  rnOneVC.navigateParams = @{kParamNavigateHideTransition: @(YES),
                            kParamNavigateGesturesInvalid: @(YES),
                            kParamNavigateIsGoNative: @(YES)};
  [self.navigationController pushViewController:rnOneVC animated:YES];
}
@end
