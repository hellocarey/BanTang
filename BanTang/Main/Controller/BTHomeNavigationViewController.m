//
//  BTHomeNavigationViewController.m
//  BanTang
//
//  Created by User on 15/12/3.
//  Copyright © 2015年 LJ. All rights reserved.
//
#import "UIImage+Image.h"
#import "BTHomeNavigationViewController.h"

@interface BTHomeNavigationViewController ()

@end

@implementation BTHomeNavigationViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //self.navigationBar.hidden = YES;

}

+ (void)initialize{
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    [navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];

    navigationBar.barStyle = UIBarStyleBlackOpaque;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if( self.viewControllers.count > 0){
                
        viewController.hidesBottomBarWhenPushed = YES;
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(popViewControllerAnimated:)];
        
    }
    
    [super pushViewController:viewController animated:animated];
    
}

@end
