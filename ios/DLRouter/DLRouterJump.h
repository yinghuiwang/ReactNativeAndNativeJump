//
//  DLRouterJump.h
//  A0131_RNToNaitve
//
//  Created by 王英辉 on 2019/2/16.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLRouterJump : NSObject

- (void)registerRootViewController:(UIViewController *)viewController;

- (void)push:(NSString *)screen params: (NSDictionary *)params;
- (void)popWithParams: (NSDictionary *)params;

/**
 通过类名获取对象，并根据参数个属性赋值

 @param targetName 目标对象类名
 @param params 参数字典
 @return 目标对象
 */
- (NSObject *)getTarget:(NSString *)targetName params: (NSDictionary *)params;

- (void)switchRightDrawPopEnabled:(Boolean) enabled;
@end

NS_ASSUME_NONNULL_END
