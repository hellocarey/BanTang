//
//  BTTabBarController.m
//  BanTang
//
//  Created by User on 15/12/2.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTMyViewController.h"
#import "BTTabBarController.h"
#import "BTHomeViewController.h"
#import "BTGoodViewController.h"
#import "BTMessageViewController.h"
#import "BTNavigationViewController.h"
#import "BTHomeNavigationViewController.h"

@interface BTTabBarController ()

@end

@implementation BTTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self addChildViewController:[[BTHomeViewController alloc] init] imageName:@"home" selectImageName:@"home_focus"];
    
    [self addChildViewController:[[BTGoodViewController alloc] init]  imageName:@"hot" selectImageName:@"hot-focus"];
    
    [self addChildViewController:[[BTMessageViewController alloc] init]  imageName:@"hot" selectImageName:@"hot-focus"];
    
    [self addChildViewController:[[BTMyViewController alloc] init]  imageName:@"user" selectImageName:@"user-focus"];
    
    [self addChildViewController:[[BTMyViewController alloc] init]  imageName:@"user" selectImageName:@"user-focus"];
    
}

- (void)addChildViewController:(UIViewController *)childController imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName{

    [childController.tabBarItem setSelectedImage:[[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [childController.tabBarItem setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    childController.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
     UINavigationController *navigationVC = [childController class]== [BTHomeViewController class] ?[[BTHomeNavigationViewController alloc] initWithRootViewController:childController]: [[BTNavigationViewController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:navigationVC];
    
}


@end
