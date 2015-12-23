//
//  BTGoodViewController.m
//  BanTang
//
//  Created by User on 15/12/2.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTProductViewController.h"
#import "BTGoodBanner.h"
#import "BTEntry.h"
#import "BTProductViewCell.h"
#import "BTViewWebController.h"
#import "BTSubjectViewController.h"
#import "BTProductDataTool.h"

@interface BTProductViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,weak)UITableView *goodTableView;

@property(nonatomic,strong)NSMutableArray *productArray;

@property(nonatomic,strong)NSMutableArray *entryArray;

@property(nonatomic,assign)NSInteger currentPage;

@property(nonatomic,assign)BOOL isUp;

@end

@implementation BTProductViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _isUp = YES;
    
    [[BTHUDProgress shareHUD] showHUD:self.view];
    
    [self setupDatasource];
    
    self.navigationItem.title  = @"精选";
    
    self.automaticallyAdjustsScrollViewInsets = false;
    
    [self setupNavigationTitleView];
    
}

- (void)setupNavigationTitleView{
    
    UISegmentedControl *segmentedControl = [[ UISegmentedControl alloc]initWithItems: nil ];
    
    segmentedControl.segmentedControlStyle =UISegmentedControlStyleBar;
    
    [segmentedControl insertSegmentWithTitle:@"精选" atIndex: 0 animated: NO ];
    
    [segmentedControl insertSegmentWithTitle:@"关注" atIndex: 1 animated: NO ];

    segmentedControl.tintColor = [UIColor clearColor];//去掉颜色,现在整个segment都看不见
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    [segmentedControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor lightTextColor]};
    
    [segmentedControl setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    
    segmentedControl.selectedSegmentIndex = 0;
    
    self.navigationItem.titleView = segmentedControl;
    
}
- (void)setupDatasource{

    [BTProductDataTool productListData:_currentPage withIsUp:_isUp productList:^(NSMutableArray<BTProduct *> *product,NSMutableArray<BTEntry *> *entry) {
        
        if(!_goodTableView){
            
            self.entryArray = entry ;
            
            self.productArray = product;
            
            [[BTHUDProgress shareHUD] hideHUD:self.view];
            
        }else if(_isUp){
            
            _productArray = product ;
            
            [_goodTableView.mj_header endRefreshing];
            
        }else{
            
            [_productArray addObjectsFromArray:product
             ];
            
            [_goodTableView.mj_footer endRefreshing];
            
        }
        
        [self.goodTableView  reloadData];

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

        BTProductViewCell *productCell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];

        productCell.product =  _productArray [indexPath.section];
        
         return productCell;
    }
    
   
}

#pragma mark - table delegate 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section != 0){
        
        BTProductViewCell *productCell = [tableView dequeueReusableCellWithIdentifier:@"productCell"];
        
        productCell.product =  _productArray [indexPath.section ];
        
        return productCell.cellHeight;
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
        
        UITableView *goodTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH - tarBarButtom-navigationHeight) style:UITableViewStyleGrouped];
        
        goodTableView.delegate = self;
        
        goodTableView.dataSource =  self;
        
        [goodTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTGoodBanner class]) bundle:nil] forCellReuseIdentifier:@"goodBanner"];
        
        [goodTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTProductViewCell class]) bundle:nil] forCellReuseIdentifier:@"productCell"];
        
        goodTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            _isUp = true;
            
            _currentPage = 0;
            
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
    
    if(!_productArray){
        
        _productArray = [NSMutableArray array];
        
    }
    
    return _productArray;
    
}

@end
