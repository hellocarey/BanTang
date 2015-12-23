//
//  BTGoodBanner.h
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickIndex)(NSString *index);

@interface BTGoodBanner : UITableViewCell

@property (strong, nonatomic) NSMutableArray *bannerArray;

@property (copy, nonatomic)ClickIndex clickIndex;

@end
