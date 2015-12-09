//
//  BTEntryView.h
//  BanTang
//
//  Created by User on 15/12/3.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTEntryView : UIView

@property(nonatomic,strong)NSMutableArray *entryArray;

@property(nonatomic,assign)CGFloat spaceWidth;

@property(nonatomic,assign)CGFloat rowCount;

@property(nonatomic,assign)CGFloat height;

@property(nonatomic,assign)BOOL isPage;

@end
