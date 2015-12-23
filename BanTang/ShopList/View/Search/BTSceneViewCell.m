//
//  BTSceneViewCell.m
//  BanTang
//
//  Created by User on 15/12/14.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTSceneViewCell.h"

@interface BTSceneViewCell()

@property(nonatomic,strong)IBOutlet UIImageView *imageview;

@property(nonatomic,strong)IBOutlet UILabel *name;

@property(nonatomic,strong)IBOutlet UILabel *smallName;

@end

@implementation BTSceneViewCell

-(void)setTags:(BTTag *)tags{
    
    _tags = tags;
    
    [_imageview sd_setImageWithURL:[NSURL URLWithString:tags.icon]];
    
    _name.text = tags.name;
    
    _smallName.text = tags.en_name;
    
}

@end
