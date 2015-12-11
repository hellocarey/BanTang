//
//  BTTabbar.m
//  BanTang
//
//  Created by User on 15/12/10.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTTabbar.h"
#import "BTLoginController.h"

@implementation BTTabbar


- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        UIImage *image = [UIImage imageNamed:@"public"];
        
        [btn setImage:image forState:UIControlStateNormal];
        
        [btn setImage:image forState:UIControlStateSelected];
        
        [btn sizeToFit];
        
        [btn addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
    }
    
    return self;
    
}

/**
 *  发布的点击事件
 */
- (void)publish{
    
    BTLoginController *login = [[BTLoginController alloc] init];
    
    [self.window.rootViewController presentViewController:login animated:YES completion:^{
        
    } ];
    
}

/**
 *  布局子控件
 */
-(void)layoutSubviews{
    
    NSArray *subItems = self.subviews;
 
    CGFloat width = screenW / 5.0;
    
    for (int i = 0; i< subItems.count; i++) {
        
        UIView *subItem = subItems[i];
        
        if([subItem class]==[UIButton class]){
        
            subItem.frame = CGRectMake(width * 2.0, 0, width , tarBarButtom);
            
        }
        else{
            
            subItem.frame = CGRectMake( width * ( i >= 3? (i):(i-1) ), 0, width , tarBarButtom);
            
        }
        
    }
    
}



@end
