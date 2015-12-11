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
#import "BTViewWebController.h"
#import "BTSubjectViewController.h"

@interface BTGoodViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)UITableView *goodTableView;

@property(nonatomic,strong)NSMutableArray *goodArray;

@property(nonatomic,strong)NSMutableArray *entryArray;

@property(nonatomic,assign)NSInteger currentPage;

@property(nonatomic,assign)BOOL isUp;

@end

@implementation BTGoodViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[BTHUDProgress shareHUD] showHUD:self.view];
    
    [self setupDatasource];
    
    self.navigationItem.title  = @"精选";
    
    self.automaticallyAdjustsScrollViewInsets = false;

}


- (void)setupDatasource{

    
    
    [[BTHttpUtil shareHttpUtil] POST:goodRequestUrl parameters:@{@"page":[NSString stringWithFormat:@"%zd",_currentPage],@"pagesize":@"10"} success:^(id responseObject) {
        
        NSMutableArray *listDic = [BTGood mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        if(!_goodTableView){
            
            self.entryArray = [BTEntry mj_objectArrayWithKeyValuesArray:responseObject[@"element"]] ;
            
            self.goodArray = [BTGood mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
            
            self.goodArray = listDic ;
            
            [[BTHUDProgress shareHUD] hideHUD:self.view];
            
        }else if(_isUp){
            
             _goodArray = listDic ;
            
            [_goodTableView.mj_header endRefreshing];
            
        }else{
            
            [_goodArray addObjectsFromArray:listDic];
            
            [_goodTableView.mj_footer endRefreshing];
            
        }
        
        [self.goodTableView  reloadData];
        
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
    
    if(indexPath.section == 0){
        
       BTGoodBanner *goodBanner = [tableView dequeueReusableCellWithIdentifier:@"goodBanner"];
        
       goodBanner.bannerArray = _entryArray;
        
        goodBanner.clickIndex = ^(NSString *extend){
          
            if([extend containsString:@"http"]){
                
                [self.navigationController pushViewController:[[BTViewWebController alloc] initWithHttpStr:extend withTitle:@"本期话题"] animated:YES];
                
            }else{
                
                BTSubjectViewController *subject = [[BTSubjectViewController alloc] init];
                
                subject.subjectId = [extend integerValue];
                
                [self.navigationController pushViewController:subject animated:YES];
                
            }
            
        };
        
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
    //此处需要优化
    return screenW == 414 ? 250:225 ;
    
}

#pragma mark - table delegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return  0.0001;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 10.0;
    
}

#pragma mark - lazy loading
- (UITableView *)goodTableView{
    
    if(!_goodTableView){
        
        UITableView *goodTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH - tarBarButtom) style:UITableViewStyleGrouped];
        
        goodTableView.delegate = self;
        
        goodTableView.dataSource =  self;
        
        [goodTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTGoodBanner class]) bundle:nil] forCellReuseIdentifier:@"goodBanner"];
        
        [goodTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTGoodViewCell class]) bundle:nil] forCellReuseIdentifier:@"goodList"];
        
        goodTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            _isUp = true;
            
            _currentPage = 0;
            
            [_goodArray removeAllObjects];
            
            [self setupDatasource];
            
        }];
        
        goodTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            
            _isUp = false;
            
            _currentPage ++;
            
            [self setupDatasource];
            
        }];
        
        goodTableView.estimatedRowHeight = 500;
        
        [self.view addSubview:goodTableView];
        
        _goodTableView =  goodTableView;
        
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
