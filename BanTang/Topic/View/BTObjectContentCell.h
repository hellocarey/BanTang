//
//  BTObjectContentCell.h
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTObject.h"

@interface BTObjectContentCell : UITableViewCell

@property(nonatomic,strong)BTObject *obj;

@property(nonatomic,assign)CGFloat cellHeight;

@end
