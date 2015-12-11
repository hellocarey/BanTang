//
//  BTGoodViewCell.m
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTGoodViewCell.h"
#import "BTUser.h"
#import "BTPic.h"

@interface BTGoodViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userImg;

@property (weak, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *createtime;

@property (weak, nonatomic) IBOutlet UIImageView *picImg;

@end

@implementation BTGoodViewCell

-(void)setGood:(BTGood *)good{
    
    _good = good;
    
    [_userImg sd_setImageWithURL:[NSURL URLWithString:good.author.avatar]];
    
    _username.text = good.author.username;
    
    _createtime.text = good.datestr;
    
    [_picImg sd_setImageWithURL:[NSURL URLWithString:((BTPic *)good.pics[0]).url]];
    
    
}

- (CGFloat)cellHeight{
    
    [self setNeedsLayout];
    
    return CGRectGetMaxY(self.picImg.frame)+(screenW - self.picImg.width);
    
}

@end
