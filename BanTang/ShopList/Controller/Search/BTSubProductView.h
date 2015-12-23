//
//  BTSubProductView.h
//  BanTang
//
//  Created by User on 15/12/14.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTTag.h"
typedef void (^SigleViewControllerBlock)(BTTag *tags) ;
@interface BTSubProductView : UIView

@property(nonatomic,strong)NSMutableArray *categoryArray;

@property (nonatomic, strong) SigleViewControllerBlock sigleViewBlock;

@end
