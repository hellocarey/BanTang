//
//  BTGoodViewController.m
//  BanTang
//
//  Created by User on 15/12/2.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTGoodViewController.h"
#import "BTGoodBanner.h"
#import "BTEntry.h"
#import "BTGoodViewCell.h"

@interface BTGoodViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)UITableView *goodTableView;

@property(nonatomic,strong)NSMutableArray *goodArray;

@property(nonatomic,strong)NSMutableArray *entryArray;

@end

@implementation BTGoodViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupDatasource];
    
    self.navigationItem.title  = @"精选";

}


- (void)setupDatasource{

    [[BTHUDProgress shareHUD] showHUD:self.view];
    
    [[BTHttpUtil shareHttpUtil] POST:goodRequestUrl parameters:@{@"page":@"0",@"pagesize":@"10"} success:^(id responseObject) {
        
        self.entryArray = [BTEntry mj_objectArrayWithKeyValuesArray:responseObject[@"element"]] ;
        
        self.goodArray = [BTGood mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        [self.goodTableView  reloadData];
        
        [[BTHUDProgress shareHUD] hideHUD:self.view];
        
    } failure:^(id responseObject) {
        
    }];
    
    
    
}

#pragma mark - table datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;{
    
    return self.goodArray.count ;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        
       BTGoodBanner *goodBanner = [tableView dequeueReusableCellWithIdentifier:@"goodBanner"];
        
       goodBanner.bannerArray = _entryArray;
        
       return  goodBanner;
        
    }else{

        BTGoodViewCell *goodCell = [tableView dequeueReusableCellWithIdentifier:@"goodList"];

        goodCell.good =  _goodArray [indexPath.section];
        
         return goodCell;
    }
    
   
}

#pragma mark - table delegate 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section != 0){
        BTGoodViewCell *goodCell = [tableView dequeueReusableCellWithIdentifier:@"goodList"];
        
        goodCell.good =  _goodArray [indexPath.section ];
        
        return goodCell.cellHeight;
    }
    
    return 250;
}

#pragma mark - table delegate
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section{
    
    return 5.0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section{
    return 0.0;
}

#pragma mark - lazy loading
- (UITableView *)goodTableView{
    
    if(!_goodTableView){
        
        UITableView *goodTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH - tarBarButtom)];
        
        [self.view addSubview:goodTableView];
        
        _goodTableView =  goodTableView;
        
        _goodTableView.delegate = self;
        
        _goodTableView.dataSource =  self;
        
        [_goodTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTGoodBanner class]) bundle:nil] forCellReuseIdentifier:@"goodBanner"];
        
        [_goodTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTGoodViewCell class]) bundle:nil] forCellReuseIdentifier:@"goodList"];
        
        _goodTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
        }];
        
        _goodTableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            
        }];
        
        _goodTableView.estimatedRowHeight = 500;
        
    }
    
    return _goodTableView;
}

- (NSMutableArray *)goodArray{
    
    if(!_goodArray){
        
        _goodArray = [NSMutableArray array];
        
    }
    
    return _goodArray;
    
}

@end
