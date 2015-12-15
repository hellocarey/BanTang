//
//  BTSingleViewCell.m
//  BanTang
//
//  Created by User on 15/12/15.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTSingleViewCell.h"

@interface BTSingleViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *coverImg;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UILabel *descLabel;

@property (weak, nonatomic) IBOutlet UILabel *recomdCountLabel;

@end

@implementation BTSingleViewCell

- (void)setTopic:(BTTopic *)topic{
    
    _topic = topic;
    
    [_coverImg setNetImg:topic.pic];
    
    _titleLabel.text = topic.title;
    
    _priceLabel.text = topic.price;
    
    _descLabel.text = topic.desc;
    
    _recomdCountLabel.text = [NSString stringWithFormat:@"%@人推荐",topic.likes];
    
}

@end
