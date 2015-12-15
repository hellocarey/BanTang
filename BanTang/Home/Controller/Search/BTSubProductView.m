//
//  BTSubProductView.m
//  BanTang
//
//  Created by User on 15/12/14.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTSubProductView.h"
#import "BTSubTagViewCell.h"
#import "BTTopic.h"


@interface BTSubProductView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,weak)UICollectionView *collectionView;

@end

@implementation BTSubProductView

#pragma mark - collection datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.categoryArray.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BTSubTagViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"subTagCell" forIndexPath:indexPath];
    
    cell.category = _categoryArray[indexPath.row];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    _sigleViewBlock(((BTTag *)self.categoryArray[indexPath.row]));
    
}

#pragma mark - lazy loading

- (void)setCategoryArray:(NSMutableArray *)categoryArray{
    
    _categoryArray = categoryArray;
    
    [self.collectionView reloadData];
    
}

- (UICollectionView *)collectionView{
    
    if(!_collectionView){
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.minimumLineSpacing = 0;
        
        flowLayout.minimumInteritemSpacing = 0;
        
        flowLayout.itemSize = CGSizeMake(self.width/3.0, self.width/3.0);
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        
        collectionView.delegate = self;
        
        collectionView.dataSource = self;
        
        collectionView.backgroundColor = [UIColor whiteColor];
        
        [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([BTSubTagViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"subTagCell"];
        
        [self addSubview:collectionView];
        
        _collectionView = collectionView;
        
    }
    
    return _collectionView;
    
}

@end
