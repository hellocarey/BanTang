//
//  BTGoodViewCell.h
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTGood.h"

@interface BTGoodViewCell : UITableViewCell

@property(nonatomic,strong)BTGood *good;

@property(nonatomic,assign)CGFloat cellHeight;

@end
