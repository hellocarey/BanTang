//
//  BTHomeViewController.m
//  BanTang
//
//  Created by User on 15/12/2.
//  Copyright © 2015年 LJ. All rights reserved.
//
#define EntryHeight (screenW - (4*10))/3.5 +20 
#define BannerHeight 230
#import "MJExtension.h"
#import "BTHomeViewController.h"
#import "BTTopic.h"
#import "BTEntry.h"
#import "BTBanner.h"
#import "BTTopicViewCell.h"
#import "BTEntryView.h"
#import "BTSearchProductViewController.h"
#import "UIImage+Image.h"
#import "BTIndexListDataTool.h"
#import "BTShopList.h"
#import "BTShopListDataTool.h"

@interface BTHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray *productListArray;

@property(nonatomic,strong)NSMutableArray *entryArray;

@property(nonatomic,strong)NSMutableArray *bannerArray;

@property(nonatomic,strong)UITableView *productListTableView;

@property(nonatomic,strong)NSMutableArray *entryImageArray;

@property(nonatomic,strong)NSMutableArray *bannerImageArray;

@property(nonatomic,assign)NSInteger currentPage;

@property(nonatomic,assign)BOOL isUp;

@end

@implementation BTHomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[BTHUDProgress shareHUD] showHUD:self.view];
    
    _isUp = YES;
    
    [self setUpDatasource];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];

    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];

}

- (void)viewWillDisappear:(BOOL)animated{
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:systemRed] forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:systemRed]];
    
}

#pragma mark - init headView

- (void)setupHeadView{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    leftBtn.alpha = 0.6;
    
    [leftBtn setImage :[UIImage imageNamed:@"home_search_icon"] forState:UIControlStateNormal];
    
    leftBtn.frame = CGRectMake(0, 0, 30, 30);
    
    //leftBtn.hidden = YES;
    
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    
    [leftBtn addTarget:self action:@selector(turnToHomeSearchPage) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem.customView.alpha = 0.2;
    
    self.navigationItem.leftBarButtonItem  = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    rightBtn.alpha = 0.6;
    
    rightBtn.frame = CGRectMake(screenW - 40, 20, 30, 30);
    
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"date"] forState:UIControlStateNormal];

    [self.view addSubview:rightBtn];
    
//    UIButton *leftBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    leftBtn1.alpha = 0.6;
//    
//    [leftBtn1 setImage :[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
//    
//    leftBtn1.frame = CGRectMake(10, 25, 30, 30);
//    
//    [leftBtn1 addTarget:self action:@selector(turnToHomeSearchPage) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:leftBtn1];
    
}

- (void)setUpDatasource{
    
    [BTIndexListDataTool getIndexData:^(NSMutableArray<BTShopList *> *productListArray, NSMutableArray<BTBanner *> *bannerList, NSMutableArray<BTEntry *> *entryList) {
        
                if(!_productListTableView){
        
                    [[BTHUDProgress shareHUD] hideHUD:self.view];
                    
                    self.productListArray = productListArray;
                    
                    self.bannerArray = bannerList;
                    
                    self.entryArray = entryList;
        
                }else if(_isUp){
        
                    _productListArray = productListArray;
        
                    [_productListTableView.mj_header endRefreshing];
        
                }else{
        
                    [_productListArray addObjectsFromArray:productListArray];
        
                    [_productListTableView.mj_footer endRefreshing];
        
                }
        
                [self.productListTableView reloadData];
        
    } withPage:_currentPage withIsUp:_isUp];
    
}

#pragma mark - table datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.topicArray.count + 2;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        
        BTEntryView *bannerView = [[BTEntryView alloc] initWithFrame:CGRectMake(0, 0,screenW, BannerHeight)];
        
        bannerView.isPage = true;
        
        bannerView.height = BannerHeight;
        
        bannerView.entryArray = self.bannerImageArray;
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"banner"];
        
        [cell addSubview:bannerView];
        
        return cell;
        
    }else if(indexPath.row == 1){
        
        BTEntryView *entryView = [[BTEntryView alloc] initWithFrame:CGRectMake(0, 0,screenW, EntryHeight)];
        
        entryView.rowCount = 3.5;
        
        entryView.spaceWidth = 10;
        
        entryView.entryArray = self.entryImageArray;
        
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"entry"];
        
        [cell addSubview:entryView];
        
        return cell;
        
    }else{
        
        BTTopicViewCell *topicCell = [tableView dequeueReusableCellWithIdentifier:@"topicCell"];
        
        topicCell.topic = _productListArray[indexPath.row-2];
        
        return topicCell;
        
    }
    
    
}

#pragma mark - table delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        
        return 250;
        
    }else if(indexPath.row == 1){
        
        return EntryHeight;
        
    }
    
    return  270;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    BTTopic *topic = self.topicArray[indexPath.row-2];
//    
//    NSLog(@"---%zd",topic.ID);
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//    CGFloat alaph =  scrollView.contentOffset.y/144.0;
//
//        [UIView animateWithDuration:0.2 animations:^{
//
//            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:systemRed] forBarMetrics:UIBarMetricsDefault];
//            
//            [self.navigationController.navigationBar setShadowImage:[UIImage imageWithColor:systemRed]];
//            
//        }];
//    
//
//    self.navigationItem.leftBarButtonItem.customView.hidden =alaph<0.7;
 
}

#pragma mark - lazy loading
- (NSMutableArray *)topicArray{
    
    if(!_productListArray){
        
        _productListArray = [NSMutableArray array];
        
    }
    
    return _productListArray;
}

-(void)setBannerArray:(NSMutableArray *)bannerArray{
    
    if(!_bannerArray){
        
        _bannerArray = [NSMutableArray array];
        
    }

    _bannerArray = bannerArray;
    
    if(!_bannerImageArray){
        
        _bannerImageArray =[NSMutableArray array];
        
        for (BTBanner *banner in bannerArray) {
            
            [_bannerImageArray addObject:banner.photo];
            
        }
        
    }
    
}


- (void)setEntryArray:(NSMutableArray *)entryArray{
    
    if(!_entryArray){
        
        _entryArray = [NSMutableArray array];
        
    }
    
    _entryArray = entryArray;
    
    if(!_entryImageArray){
        
        _entryImageArray =[NSMutableArray array];
        
        for (BTEntry *entry in entryArray) {
            
            [_entryImageArray addObject:entry.pic1];
            
        }
        
    }
}

- (UITableView *)productListTableView{
    
    if(!_productListTableView){
        
        _productListTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH - tarBarButtom)];
        
        _productListTableView.delegate = self;
        
        _productListTableView.dataSource = self;
        
        [_productListTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTTopicViewCell class]) bundle:nil] forCellReuseIdentifier:@"topicCell"];
        
        _productListTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            _isUp = true;
            
            _currentPage = 0;
            
            [self setUpDatasource];
            
        }];
        
        _productListTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
           
            _isUp = false;
            
            _currentPage ++;
            
            [self setUpDatasource];
            
        }];

        [self.view addSubview:_productListTableView];
        
        [self setupHeadView];
        
    }
    
    return _productListTableView;
}

#pragma mark - click event

-  (void)turnToHomeSearchPage{
    
    BTSearchProductViewController *searchView = [[BTSearchProductViewController alloc] init];
    
    [self.navigationController pushViewController:searchView animated:YES];
    
}

@end
