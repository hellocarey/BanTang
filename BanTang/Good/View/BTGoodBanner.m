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

@end;

@implementation BTGoodBanner

- (void)setBannerArray:(NSMutableArray *)bannerArray{
    
    _bannerArray = bannerArray;
    
    [_leftImg sd_setImageWithURL:[NSURL URLWithString:((BTEntry *)bannerArray[0]).pic1]];
    
    [_rightImg sd_setImageWithURL:[NSURL URLWithString:((BTEntry *)bannerArray[1]).pic1]];
    
    [_rightSmallImg1 sd_setImageWithURL:[NSURL URLWithString:((BTEntry *)bannerArray[2]).pic1]];
    
    [_rightSmallImg2 sd_setImageWithURL:[NSURL URLWithString:((BTEntry *)bannerArray[3]).pic1]];
    
    
}


@end
