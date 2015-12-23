//
//  BTSubTagViewCell.m
//  BanTang
//
//  Created by User on 15/12/14.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTSubTagViewCell.h"
@interface BTSubTagViewCell()

@property(nonatomic,weak)IBOutlet UIImageView *imageView;

@property(nonatomic,weak)IBOutlet UILabel *name;

@end
@implementation BTSubTagViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setCategory:(BTTag *)category{
    
    _category = category;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:category.icon]];
    
    _name.text = category.name;
    
}

@end
