//
//  BTSingleProductListViewController.m
//  BanTang
//
//  Created by User on 15/12/15.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTSingleProductListViewController.h"
#import "BTTopic.h"
#import "BTSingleViewCell.h"

@interface BTSingleProductListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *topicTableView;

@property(nonatomic,strong)NSMutableArray *topicArray;

@property(nonatomic,assign)NSInteger currentPage;

@property(nonatomic,assign)BOOL isUp;

@end

@implementation BTSingleProductListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[BTHUDProgress shareHUD] showHUD:self.view];
    
    [self setUpDatasource];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.title = _navigationTitle;
    
}

- (void)setUpDatasource{
    
    [[BTHttpUtil shareHttpUtil] GET:productListRequest parameters:@{ @"subclass": _subclass,@"page":[NSString stringWithFormat:@"%zd",_currentPage], @"pagesize":[NSString stringWithFormat:@"%zd",PAGESIZE] } success:^(id responseObject) {
        
        NSMutableArray *topDic = [BTTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        if(!_topicTableView){
            
            self.topicArray = topDic;
            
            [[BTHUDProgress shareHUD] hideHUD:self.view];
            
        }else{
            
            [_topicArray addObjectsFromArray:topDic];
            
            [_topicTableView.mj_footer endRefreshing];
            
        }
        
        [self.topicTableView reloadData];
        
    } failure:^(id responseObject) {
        
        
    }];
    
}

#pragma mark - table datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.topicArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    BTSingleViewCell *topicCell = [tableView dequeueReusableCellWithIdentifier:@"topicCell"];
    
    topicCell.topic = _topicArray[indexPath.section];
    
    return topicCell;

}

#pragma mark - table delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return  120;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 5.0;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   //BTTopic *topic = self.topicArray[indexPath.section];
    
}

#pragma mark - lazy loading
//- (NSMutableArray *)topicArray{
//    
//    if(!_topicArray){
//        
//        _topicArray = [NSMutableArray array];
//        
//    }
//    
//    return _topicArray;
//}



- (UITableView *)topicTableView{
    
    if(!_topicTableView){
        
        _topicTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
        
        _topicTableView.delegate = self;
        
        _topicTableView.dataSource = self;
        
        [_topicTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTSingleViewCell class]) bundle:nil] forCellReuseIdentifier:@"topicCell"];

        _topicTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            
            _isUp = false;
            
            _currentPage ++;
            
            [self setUpDatasource];
            
        }];
        
        [self.view addSubview:_topicTableView];
        
    }
    
    return _topicTableView;
}

@end

