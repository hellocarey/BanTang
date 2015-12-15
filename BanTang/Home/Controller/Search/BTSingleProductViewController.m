//
//  BTSingleProductViewController.m
//  BanTang
//
//  Created by User on 15/12/13.
//  Copyright © 2015年 LJ. All rights reserved.
//
#import "BTTag.h"
#import "BTSingleProductViewController.h"
#import "UIImage+Image.h"
#import "BTSubProductView.h"
#import "BTSingleProductListViewController.h"

#define grayColor [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0]
#define tabHeight 39
#define leftTableWidth 100
#define contentHeight (screenH - tabHeight-navigationHeight)

@interface BTSingleProductViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,weak)UITableView *leftTableView;

@property(nonatomic,strong)NSMutableArray *categoryArray;

@property(nonatomic,strong)BTSubProductView *categoryCategoryView;

@property(nonatomic,assign)NSInteger selectIndex;

@end

@implementation BTSingleProductViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[BTHUDProgress shareHUD] showHUD:self.view];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupProductListDatasource];

}

#pragma mark - setup

- (void)setupProductListDatasource{
    
    [[BTHttpUtil shareHttpUtil] POST:categoryListRequestUrl parameters:@{@"is_new":@"1"} success:^(id responseObject) {
        
       self.categoryArray =[BTTag mj_objectArrayWithKeyValuesArray:responseObject];
        
       self.categoryCategoryView.categoryArray =((BTTag *) _categoryArray[0]).subclass;
        
       [[BTHUDProgress shareHUD] hideHUD:self.view];
        
    } failure:^(id responseObject) {
        
    }];
    
}


#pragma mark - datasouce 


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.categoryArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"category"];
    
    if(!cell){
        
        cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"category"];
        
        
        
    }
    
    [self setupCell:cell withIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

#pragma mark - table delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.categoryCategoryView.categoryArray =((BTTag *) _categoryArray[indexPath.row]).subclass;
    
    _selectIndex = indexPath.row;
    
    [tableView reloadData];
}

#pragma mark - setting cell

- (void)setupCell:(UITableViewCell *)cell withIndex:(NSInteger)row{
    
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    BTTag *tags = (BTTag *) _categoryArray[row];
    
    UILabel *label = [[UILabel alloc] init];
    
    label.frame = cell.bounds;
    
    label.width = leftTableWidth;
    
    label.font = [UIFont systemFontOfSize:12];
    
    label.text = tags.name;
    
    label.textColor = systemGray;
    
    label.textAlignment = NSTextAlignmentCenter;
    
    [cell addSubview:label];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,2, cell.height)];
    
    [cell addSubview:view];
    
    if(_selectIndex == row ){
        
        view.backgroundColor = systemRed;
        
        [label setBackgroundColor:[UIColor whiteColor]];
        
    }else{
        
        view.backgroundColor = grayColor;
        
        [label setBackgroundColor:grayColor];
        
    }

}

#pragma mark - lazy loading

- (UITableView *)leftTableView{
    
    if(!_leftTableView){
        
        UITableView *leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tabHeight,leftTableWidth, contentHeight)];
        
        leftTableView.delegate = self;
        
        leftTableView.dataSource = self;
        
        leftTableView.backgroundColor = grayColor;
        
        leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self.view addSubview:leftTableView];
        
        [leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
        
        _leftTableView = leftTableView;
        
    }
    
    return _leftTableView;
    
}




- (void)setCategoryArray:(NSMutableArray *)categoryArray{
    
    _categoryArray = categoryArray;
    
    [self.leftTableView reloadData];
    
}

- (BTSubProductView *)categoryCategoryView{
    
    if(!_categoryCategoryView){
        
        BTSubProductView *categoryCategoryView = [[BTSubProductView alloc] initWithFrame:CGRectMake(leftTableWidth, tabHeight, screenW - leftTableWidth, contentHeight)];
        
        [self.view addSubview:categoryCategoryView];
        
        _categoryCategoryView = categoryCategoryView;
        
        BTWeakSelf
        _categoryCategoryView.sigleViewBlock = ^(BTTag *tags){
            
            BTSingleProductListViewController *singleProduct = [[BTSingleProductListViewController alloc] init];
            
            singleProduct.subclass = tags.ID;
            
            singleProduct.navigationTitle = tags.name;
            
            [self.navigationController pushViewController:singleProduct animated:YES];
            
        };
        
    }
    
    return _categoryCategoryView;
    
}

@end
