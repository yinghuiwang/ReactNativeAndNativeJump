//
//  DLRNViewController.h
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/21.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLRNViewController : UIViewController

@property(nonatomic, copy) NSString *screenName;
@property(nonatomic, copy) NSString *fromScreenName;
@property(nonatomic, copy) NSDictionary *navigateParams;

@end

NS_ASSUME_NONNULL_END
