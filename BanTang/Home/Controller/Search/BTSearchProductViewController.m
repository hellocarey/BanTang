//
//  BTSearchProductViewController.m
//  BanTang
//
//  Created by User on 15/12/13.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTSearchProductViewController.h"
#import "BTSingleProductViewController.h"
#import "BTProductListViewController.h"

@interface BTSearchProductViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UIButton *selectedBtn;

@property (weak, nonatomic) UIView *lineView;

@property (strong, nonatomic) NSMutableArray *titleButtons;

@end

@implementation BTSearchProductViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.navigationBar.hidden = NO;
    
    [self setupChildrenController];

    [self setupScrollView];
    
    [self setupTitleView];
    
    

}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    
}

#pragma mark -setup

- (void)setupChildrenController{
    
    BTSingleProductViewController *singleProduct = [[BTSingleProductViewController alloc] init];
    
    [self addChildViewController:singleProduct];
    
    BTProductListViewController *productList = [[BTProductListViewController alloc] init];
    
    [self addChildViewController:productList];
    
}

- (void)setupScrollView{
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    scrollView.frame = self.view.bounds;
    
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count*screenW, 0);
    
    scrollView.delegate = self;
    
    scrollView.bounces = NO;

    scrollView.pagingEnabled = YES;
    
    [self.view addSubview:scrollView];
    
    _scrollView = scrollView;
    
    [self scrollViewDidEndDecelerating:scrollView];
    
}

- (void)setupTitleView{
    
    NSArray *titleArray = @[@"单品",@"清单"];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenW, 39)];
    
    [self.view addSubview:titleView];
    
    NSInteger totalCount = self.childViewControllers.count;
    
    CGFloat width = screenW / totalCount ;
    
    CGFloat x = 0 ;
    
    for (NSInteger i = 0; i < self.childViewControllers.count; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [btn addTarget:self action:@selector(clickTitle:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.frame = CGRectMake( x , 0 , width, titleView.height);
        
        x += btn.right;
        
        [self.titleButtons addObject:btn];
        
        [titleView addSubview:btn];
        
    }
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake((screenW-screenW/2.0)*0.5 , titleView.height-2, screenW/4.0, 2)];
    
    lineView.backgroundColor = systemRed;
    
    [titleView addSubview:lineView];
    
    _lineView = lineView;
    
    [self clickTitle:[titleView.subviews firstObject]];
    
}

- (void)clickTitle:(UIButton *)btn{
    
    _selectedBtn.selected = NO;
    
    btn.selected = YES;
    
    _selectedBtn = btn ;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        CGPoint linePoint = _lineView.center;
        
        linePoint.x =  btn.center.x;
        
        _lineView.center = linePoint ;
        
    }];
    
    // 让scrollView滚动到对应的位置
    CGPoint offset = self.scrollView.contentOffset;
    
    offset.x = self.view.width * [self.titleButtons indexOfObject:btn];
    
    [self.scrollView setContentOffset:offset animated:YES];
    
}

#pragma mark - scrollDelegate 

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    int index = scrollView.contentOffset.x / scrollView.width;
    
    if(self.titleButtons.count==0)return;
    
    [self clickTitle:self.titleButtons[index]];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    NSInteger index = scrollView.contentOffset.x / screenW;
    
    UIViewController *willViewController = self.childViewControllers[index];
    
    if(willViewController.isViewLoaded )return;
    
    willViewController.view.frame = scrollView.bounds;
    
    [scrollView addSubview:willViewController.view];
    
}

#pragma mark - lazy loding
- (NSMutableArray *)titleButtons{
    
    if(!_titleButtons){
        
        _titleButtons = [NSMutableArray array];
        
    }
    
    return _titleButtons;
    
}
@end
