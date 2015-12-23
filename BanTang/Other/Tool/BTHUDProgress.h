//
//  BTHUDProgress.h
//  BanTang
//
//  Created by User on 15/12/10.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTHUDProgress : NSObject

/**
 *  loading单例
 *
 *  @return 单例对象
 */
+ (instancetype)shareHUD;

/**
 *  loading显示
 *
 *  @param view 视图
 */
- (void)showHUD:(UIView *)view;

/**
 *  loading隐藏
 *
 *  @param view 视图
 */
- (void)hideHUD:(UIView *)view;

@end
