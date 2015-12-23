//
//  BTMessageBanner.m
//  BanTang
//
//  Created by User on 15/12/17.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTMessageBanner.h"
#import "BTEntry.h"

@implementation BTMessageBanner

- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        UILabel  *title = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
                           
        title.text = @"热门活动";
        
        [self addSubview:title];
        
    }
    
    return self;
    
}

- (void)setBannerArray:(NSMutableArray *)bannerArray{
    
    _bannerArray = bannerArray;
    
    CGFloat y = 30;
    
    for (NSInteger i = 0; i<bannerArray.count; i++) {
        
        UIImageView *imageView = [UIImageView new];
        
        imageView.frame = CGRectMake(10, y, screenW - 20, 180);
        
        [imageView setNetImg:((BTEntry *)bannerArray[i]).pic1];
    
        [self addSubview: imageView];
        
        y += imageView.width;
    }
    
    
}

@end
