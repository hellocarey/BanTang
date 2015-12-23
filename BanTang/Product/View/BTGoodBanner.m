//
//  BTGoodBanner.m
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//
#import "BTEntry.h"
#import "BTGoodBanner.h"


@interface BTGoodBanner()

@property (weak, nonatomic) IBOutlet UIImageView *leftImg;

@property (weak, nonatomic) IBOutlet UIImageView *rightImg;

@property (weak, nonatomic) IBOutlet UIImageView *rightSmallImg1;

@property (weak, nonatomic) IBOutlet UIImageView *rightSmallImg2;

@property (strong, nonatomic) NSArray *imgObjectArray;

@end;

@implementation BTGoodBanner

- (void)awakeFromNib{
    
    for (int i = 0; i<self.imgObjectArray.count; i++) {
        
        UIImageView *imageView  = _imgObjectArray[i];
        
        imageView.userInteractionEnabled = YES;
        
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turnToThisPage:)]];
        
        imageView.tag = i;
        
    }
    
}

- (void)setBannerArray:(NSMutableArray *)bannerArray{
    
    _bannerArray = bannerArray;
    
    for (int i = 0; i<self.imgObjectArray.count; i++) {
        
        [self setDataSource:_imgObjectArray[i] withEntryIndex:i];
        
    }
    
}

- (void)setDataSource:(UIImageView *)object withEntryIndex:(NSInteger)index{
    
    [object sd_setImageWithURL:[NSURL URLWithString:((BTEntry *)_bannerArray[index]).pic1]];
    
}

#pragma mark -event
- (void)turnToThisPage:(UITapGestureRecognizer *)tap{
    
    _clickIndex(((BTEntry *)_bannerArray[tap.view.tag]).extend_id);
    
}

#pragma mark - lazy loading

- (NSArray *)imgObjectArray{
    
    if(!_imgObjectArray){
        
        _imgObjectArray = @[_leftImg,_rightImg,_rightSmallImg1,_rightSmallImg2];
        
    }
    
    return _imgObjectArray;
    
}

@end
