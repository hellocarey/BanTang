//
//  BTProductListViewController.m
//  BanTang
//
//  Created by User on 15/12/13.
//  Copyright © 2015年 LJ. All rights reserved.
//
#import "BTTag.h"
#import "BTShopListCategoryViewController.h"
#import "BTSceneViewCell.h"
#import "BTTopicViewController.h"
#import "BTShopListDataTool.h"
#define tabHeight 39

@interface BTShopListCategoryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong, nonatomic) NSMutableArray *sceneArray;

@property (weak, nonatomic) UICollectionView *collectionView;

@end

@implementation BTShopListCategoryViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[BTHUDProgress shareHUD] showHUD:self.view];

    [self setupSceneDatasource];
    
}

- (void)setupSceneDatasource{
    
    [[BTHttpUtil shareHttpUtil] POST:sceneRequestUrl parameters:nil success:^(id responseObject) {
        
        self.sceneArray = [BTTag mj_objectArrayWithKeyValuesArray:responseObject];
        
        [[BTHUDProgress shareHUD] hideHUD:self.view];
        
    } failure:^(id responseObject) {
        
    }];
    
    [BTShopListDataTool shopListCategoryData:^(NSMutableArray<BTShopList *> *productList) {
        
        self.sceneArray = [BTTag mj_objectArrayWithKeyValuesArray:productList];
        
        [[BTHUDProgress shareHUD] hideHUD:self.view];
        
    }];
    
}

#pragma mark - collection datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.sceneArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BTSceneViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"sceneCell" forIndexPath:indexPath];
    
    cell.tags = _sceneArray[indexPath.row];
    
    return cell;
    
}

#pragma mark -collection delegate 
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BTTag *tags = ((BTTag *)_sceneArray[indexPath.row]);
    
    BTTopicViewController *topic = [[BTTopicViewController alloc] init];
    
    topic.topicId = [tags.ID integerValue];
    
    topic.title = tags.name;
    
    [self.navigationController pushViewController:topic animated:YES];

}

#pragma mark -lazy loading

- (void)setSceneArray:(NSMutableArray *)sceneArray{
    
    _sceneArray = sceneArray;
    
    [self.collectionView reloadData];

}

- (UICollectionView *)collectionView{
    
    if(!_collectionView){
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];

        flowLayout.minimumLineSpacing = 0;
        
        flowLayout.minimumInteritemSpacing = 0;
        
        flowLayout.itemSize = CGSizeMake(screenW/3.0, screenW/3.0);
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, tabHeight,screenW, screenH -tabHeight-navigationHeight) collectionViewLayout:flowLayout];
        
        collectionView.delegate = self;
        
        collectionView.dataSource = self;
        
        [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BTSceneViewCell class])  bundle:nil] forCellWithReuseIdentifier:@"sceneCell"];
        
        collectionView.backgroundColor = [UIColor whiteColor];
        
        [self.view addSubview:collectionView];
        
        _collectionView = collectionView;
    }
    
    return _collectionView;
    
}
@end
