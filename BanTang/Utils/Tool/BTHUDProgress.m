//
//  BTHUDProgress.m
//  BanTang
//
//  Created by User on 15/12/10.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTHUDProgress.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation BTHUDProgress

+ (instancetype)shareHUD{
    
    static dispatch_once_t onceToken;
    
    static BTHUDProgress *progress;
    
    dispatch_once(&onceToken, ^{
        
        progress = [[BTHUDProgress alloc] init];
        
    });
    
    return progress;
    
}

- (void)showHUD:(UIView *)view{
    
    [MBProgressHUD showHUDAddedTo:view animated:YES];
    
}

- (void)hideHUD:(UIView *)view{
    
    [MBProgressHUD hideHUDForView:view animated:YES];
    
}

@end
