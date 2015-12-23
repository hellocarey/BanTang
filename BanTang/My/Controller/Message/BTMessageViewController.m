//
//  BTMessageViewController.m
//  BanTang
//
//  Created by User on 15/12/2.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTMessageViewController.h"
#import "BTBanner.h"
#import "BTMessageNoticeCell.h"
//#import "BTMessageBanner.h"


@interface BTMessageViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,assign)NSInteger currentPage;

@property(nonatomic,weak)UITableView *messageTableView;

@property(nonatomic,weak)NSMutableArray *bannerArray;

@end

@implementation BTMessageViewController

static NSArray *iconArray;

static NSArray *textArray;

+ (void)initialize{
    
    iconArray = @[@"icon_message_user",@"icon_message_comment",@"icon_message_like",@"icon_message_reward",@"icon_message_notification"];
    
    textArray = @[@"新的粉丝",@"新的评论",@"新的喜欢",@"新的奖励",@"新的通知"];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"消息";
    
    [[BTHUDProgress shareHUD] showHUD:self.view];
    
    [self setUpDatasource];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)setUpDatasource{
    
    [[BTHttpUtil shareHttpUtil] GET:noticetListRequest parameters:@{ @"type":[NSString stringWithFormat:@"%zd",1]} success:^(id responseObject){
        
        self.bannerArray = [BTBanner mj_objectArrayWithKeyValuesArray:responseObject[@"element"]];
        
        [self.meeageTableView reloadData];
        
        [[BTHUDProgress shareHUD] hideHUD:self.view];
        
    } failure:^(id responseObject) {
        
        
    }];
    
}

#pragma mark - table datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return section == 0 ? 5 : self.bannerArray.count ;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView; {
    
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.section == 0 ){
        
        BTMessageNoticeCell *messageCell = [tableView dequeueReusableCellWithIdentifier:@"noticeCell"];
        
        [messageCell setMessage:iconArray[indexPath.row] withText:textArray[indexPath.row]];
        
        messageCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return messageCell;
        
    }
    return nil;
//    else{
//        
//        BTMessageBanner *bannerCell = [tableView dequeueReusableCellWithIdentifier:@"bannerCell"];
//        
//        if(!bannerCell){
//            
//           bannerCell = [[BTMessageBanner alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"bannerCell"];
//            
//            bannerCell.bannerArray  = _bannerArray [indexPath.row];
//            ;
//        }
//        
//        return bannerCell;
//        
//        
//    }
   
}

#pragma mark - table delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.section == 0){
        
        return 50;
        
    }
    
    return  250;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

#pragma mark - lazy loading


- (UITableView *)meeageTableView{
    
    if(!_messageTableView){
        
        UITableView *messageTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH - tarBarButtom)];
        
        messageTableView.delegate = self;
        
        messageTableView.dataSource = self;
        
        [messageTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTMessageNoticeCell class]) bundle:nil] forCellReuseIdentifier:@"noticeCell"];
        
//        [messageTableView registerNib:[UINib nibWithNibName:NSStringFromClass([BTMessageBanner class]) bundle:nil] forCellReuseIdentifier:@"bannerCell"];

        [self.view addSubview:messageTableView];
        
        _messageTableView = messageTableView;
    }
    NSLog(@"%@",_messageTableView);
    return _messageTableView;
}

@end
