//
//  BTGoodViewCell.h
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTProduct.h"

@interface BTProductViewCell : UITableViewCell

@property(nonatomic,strong)BTProduct *product;

@property(nonatomic,assign)CGFloat cellHeight;

@end
