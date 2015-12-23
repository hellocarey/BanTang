//
//  BTMessageNoticeCell.m
//  BanTang
//
//  Created by User on 15/12/17.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTMessageNoticeCell.h"

@interface BTMessageNoticeCell()

@property (weak, nonatomic) IBOutlet UIImageView *messageIcon;

@property (weak, nonatomic) IBOutlet UILabel *messageText;

@end

@implementation BTMessageNoticeCell

- (void)awakeFromNib {
   
}

- (void)setMessage:(NSString *)icon withText:(NSString *)messageText{
    
    _messageIcon.image = [UIImage imageNamed:icon];
    
    _messageText.text = messageText;
    
}



@end
