//
//  BTTopicViewCell.m
//  BanTang
//
//  Created by User on 15/12/3.
//  Copyright © 2015年 LJ. All rights reserved.
//


#import "BTTopicViewCell.h"

@interface BTTopicViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *topicImg;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@end

@implementation BTTopicViewCell

- (void)setTopic:(BTTopic *)topic{
    
    _topic = topic;
    
    [self.topicImg sd_setImageWithURL:[NSURL URLWithString:topic.pic]];
    
    self.title.text = topic.title;
    
    self.numLabel.text = topic.likes;
    
}

@end
