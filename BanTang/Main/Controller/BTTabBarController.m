//
//  BTTabBarController.m
//  BanTang
//
//  Created by User on 15/12/2.
//  Copyright © 2015年 LJ. All rights reserved.
//
#import "BTSearchProductViewController.h"
#import "BTMyViewController.h"
#import "BTTabBarController.h"
#import "BTHomeViewController.h"
#import "BTProductViewController.h"
#import "BTMessageViewController.h"
#import "BTNavigationViewController.h"
#import "BTHomeNavigationViewController.h"
#import "BTTabbar.h"

@interface BTTabBarController ()

@property(nonatomic,weak)BTTabbar *tabbar;

@end

@implementation BTTabBarController

static NSArray *tabArray;

+ (void)initialize{
    
    tabArray = @[@{@"tab_home":[BTHomeViewController new]},@{@"tab_good":[BTProductViewController new]},@{@"tab_category":[BTMessageViewController new]},@{@"tab_my":[BTMyViewController new]}];
    
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self addChildrens];
    
    [self setupItemBar];

}

- (void)addChildrens{
    
    for (NSDictionary *dic in tabArray) {
        
        NSString *key = [dic.allKeys firstObject];
        
        [self addChildViewController:[dic.allValues firstObject]  imageName:key selectImageName:[NSString stringWithFormat:@"%@_pressed",key]];
        
    }
    
}

- (void)addChildViewController:(UIViewController *)childController imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName{

    [childController.tabBarItem setSelectedImage:[[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    [childController.tabBarItem setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    childController.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
     UINavigationController *navigationVC = [childController class]== [BTHomeViewController class] ?[[BTHomeNavigationViewController alloc] initWithRootViewController:childController]: [[BTNavigationViewController alloc] initWithRootViewController:childController];
    
    [self addChildViewController:navigationVC];
    
}

- (void)setupItemBar{
    
    BTTabbar *tabbar = [[BTTabbar alloc] init];
    
    tabbar.backgroundImage = [UIImage imageNamed:@"tab_bar_bg"];
    
    _tabbar =  tabbar;
    [self setValue:tabbar forKey:@"tabBar"];
    
    //[self setValue:[UIImage imageNamed:@"tab_bar_bg"] forKeyPath:@"tabBar.backgroundImage"];
    
    //self.;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
   _tabbar.backgroundImage = [UIImage imageNamed:@"tab_bar_bg"];
    
}



@end
