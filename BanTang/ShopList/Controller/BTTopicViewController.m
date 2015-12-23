//
//  BTTopicViewController.m
//  BanTang
//
//  Created by User on 15/12/14.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTTopicViewController.h"
#import "BTTopic.h"
#import "BTTopicViewCell.h"

@interface BTTopicViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,assign)NSInteger currentPage;

@property(nonatomic,assign)BOOL isUp;

@property(nonatomic,strong)NSMutableArray *topicArray;

@property(nonatomic,strong)UITableView *topicTableView;

@end

@implementation BTTopicViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[BTHUDProgress shareHUD] showHUD:self.view];
    
    [self setUpDatasource];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = false;
    
    self.navigationItem.title = self.navigationTitle;
    
}


- (void)setUpDatasource{

    [[BTHttpUtil shareHttpUtil] GET:topListRequestBySceneId parameters:@{ @"scene":[NSString stringWithFormat:@"%zd",self.topicId],@"page":[NSString stringWithFormat:@"%zd",_currentPage],@"pagesize":[NSString stringWithFormat:@"%zd",PAGESIZE] } success:^(id responseObject) {
        
        NSMutableArray *topDic = [BTTopic mj_objectArrayWithKeyValuesArray:responseObject[@"topic"]];
        
        if(!_topicTableView){
            
            self.topicArray = topDic;
            
            [[BTHUDProgress shareHUD] hideHUD:self.view];
            
        }else if(_isUp){
            
            _topicArray = topDic;
            
            [_topicTableView.mj_header endRefreshing];
            
        }else{
            
            [self.topicArray addObjectsFromArray:topDic];
            
            [_topicTableView.mj_footer endRefreshing];
            
        }
        
        [self.topicTableView reloadData];
        
    } failure:^(id responseObject) {
        
        
    }];
    
}

#pragma mark - table datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.topicArray.count ;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    BTTopicViewCell *topicCell = [tableView dequeueReusableCellWithIdentifier:@"topicCell"];
    
    topicCell.topic = _topicArray[indexPath.row];
    
    return topicCell;
    
}

#pragma mark - table delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return  270;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - lazy loading

- (void)setTopicArray:(NSMutableArray *)topicArray{
    
    _topicArray = topicArray;
    
}

- (UITableView *)topicTableView{
    
    if(!_topicTableView){
        
        _topicTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
        
        _topicTableView.delegate = self;
        
        _topicTableView.dataSource = self;
        
        [_topicTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTTopicViewCell class]) bundle:nil] forCellReuseIdentifier:@"topicCell"];
        
        _topicTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            [_topicArray removeAllObjects];
            
            _isUp = true;
            
            _currentPage = 0;
            
            [self setUpDatasource];
            
        }];
        
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
