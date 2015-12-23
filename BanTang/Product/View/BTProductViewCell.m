//
//  BTGoodViewCell.m
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTProductViewCell.h"
#import "BTUser.h"
#import "BTPic.h"

@interface BTProductViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userImg;

@property (weak, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *createtime;

@property (weak, nonatomic) IBOutlet UIImageView *picImg;

@end

@implementation BTProductViewCell

-(void)setProduct:(BTProduct *)product{
    
    _product = product;
    
    [_userImg setHeader:product.author.avatar];
    
    _username.text = product.author.username;
    
    _createtime.text = product.datestr;
    
    [_picImg setNetImg:((BTPic *)product.pics[0]).url];
    
    
}

- (CGFloat)cellHeight{
    
    [self setNeedsLayout];
    
    return CGRectGetMaxY(self.picImg.frame)+(screenW - self.picImg.width);
    
}

@end
