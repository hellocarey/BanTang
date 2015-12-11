//
//  BTObjectContentCell.m
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTObjectContentCell.h"

@interface BTObjectContentCell ()

@property (weak, nonatomic) IBOutlet UIImageView *objImg;

@property (weak, nonatomic) IBOutlet UILabel *dateStr;

@property (weak, nonatomic) IBOutlet UILabel *descriptionStr;

@property (weak, nonatomic) IBOutlet UIView *userImgsView;

@end

@implementation BTObjectContentCell

- (void)awakeFromNib {
    
}

- (void)setObj:(BTObject *)obj{
    
    _obj = obj;
    
    [_objImg sd_setImageWithURL:[NSURL URLWithString:obj.pic2]];
    
    _dateStr.text = obj.datestr;
    
    _descriptionStr.text = obj.descriptionStr;
    
}

- (CGFloat)cellHeight{
    
    [self setNeedsLayout];
    NSLog(@"%@",NSStringFromCGRect(_dateStr.frame));
    NSLog(@"%@",NSStringFromCGRect(_userImgsView.frame));
    
    return CGRectGetMaxY(_userImgsView.frame);
    
}

@end
