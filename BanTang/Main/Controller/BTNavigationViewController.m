//
//  BTNavigationViewController.m
//  BanTang
//
//  Created by User on 15/12/3.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTNavigationViewController.h"
#import "UIImage+Image.h"

@interface BTNavigationViewController ()

@end

@implementation BTNavigationViewController

+ (void)initialize{
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    [navigationBar setBackgroundImage:[UIImage imageWithColor:systemRed] forBarMetrics:UIBarMetricsDefault];
    
    navigationBar.barStyle = UIBarStyleBlackOpaque;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if( self.viewControllers.count > 0){
    
        viewController.view.backgroundColor = [UIColor whiteColor];
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(popViewControllerAnimated:)];
        
    }
    
    [super pushViewController:viewController animated:animated];
    
}



@end
