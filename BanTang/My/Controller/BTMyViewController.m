//
//  BTMyViewController.m
//  BanTang
//
//  Created by User on 15/12/3.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTMyViewController.h"

@interface BTMyViewController ()

@end

@implementation BTMyViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //self.navigationController.navigationBar.hidden = YES;
    
    [self setupDataSource];

}

-(void)viewWillDisappear:(BOOL)animated{
    
    //self.navigationController.navigationBar.hidden = NO;
}

- (void)setupDataSource{
    
    [[BTHttpUtil shareHttpUtil] POST:userInfoRequestUrl parameters:nil success:^(id responseObject) {
        
    } failure:^(id responseObject) {
        
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
