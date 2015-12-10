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

+(void)initialize{
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    [navigationBar setBackgroundImage:[UIImage imageWithColor:systemRed] forBarMetrics:UIBarMetricsDefault];
    
    navigationBar.barStyle = UIBarStyleBlackOpaque;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
