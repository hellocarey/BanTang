//
//  BTSubjectViewController.m
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//
#import "BTObject.h"
#import "BTSubjectViewController.h"
#import "BTObjectContentCell.h"

@interface BTSubjectViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) BTObject *obj;

@property (weak, nonatomic) UITableView *subjectTableView;

@end

@implementation BTSubjectViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self setupNavigation];
    
    [self setupDataSource:_subjectId];
    
    self.navigationItem.title = @"本期话题";
    
}

#pragma mark - set navigation 
- (void)setupNavigation{
    
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"share"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStyleDone target:self action:@selector(share)];
    
}

- (void)setupDataSource:(NSInteger)subjectId{
    
    [[BTHUDProgress shareHUD] showHUD:self.view];
 
    [[BTHttpUtil shareHttpUtil] POST:subjectInfoRequestUrl parameters:@{@"subject_id":[NSString stringWithFormat:@"%zd",subjectId]} success:^(id responseObject) {
        
       _obj = [BTObject mj_objectWithKeyValues:responseObject[@"subject"]] ;
        
        [self.subjectTableView reloadData];
        
        [[BTHUDProgress shareHUD] hideHUD:self.view];
        
    } failure:^(id responseObject) {
        
    }];
    
}

#pragma mark - table delegate 
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BTObjectContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"objectContent"];
    
    cell.obj = _obj;
    
    return cell.cellHeight;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BTObjectContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"objectContent" forIndexPath:indexPath];

    cell.obj = _obj;
    
    return cell;
}

#pragma mark - lazy loading

- (UITableView *)subjectTableView{
    
    if(!_subjectTableView){
        
        UITableView *subjectTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH - tarBarButtom) style:UITableViewStylePlain];
        
        subjectTableView.delegate = self;
        
        subjectTableView.dataSource = self;
        
        subjectTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
        }];
        
        subjectTableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
            
        }];
        
        [subjectTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTObjectContentCell class]) bundle:nil] forCellReuseIdentifier:@"objectContent"];
        
        [self.view addSubview:subjectTableView];
        
        _subjectTableView = subjectTableView;
        
    }
    
    return _subjectTableView;
    
}

#pragma mark target

- (void)share{
    
}

@end
