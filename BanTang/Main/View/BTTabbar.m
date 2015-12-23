//
//  BTTabbar.m
//  BanTang
//
//  Created by User on 15/12/10.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTTabbar.h"
#import "BTLoginController.h"

@interface BTTabbar()

@property(nonatomic,strong)NSArray *tabArray;

@end

@implementation BTTabbar


- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    
    if (self) {

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

        [btn setImage: [UIImage imageNamed:@"tab_publish_add"] forState:UIControlStateNormal];
        
        [btn setImage: [UIImage imageNamed:@"tab_publish_add_pressed"] forState:UIControlStateSelected];
        
        [btn sizeToFit];
        
        [btn addTarget:self action:@selector(publish) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:btn];
        
        self.selectionIndicatorImage = [UIImage imageNamed:@"tab_bar_bg"];
        
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


//-(UIImage *)backgroundImage{
//    
//    return [UIImage imageNamed:@"tab_bar_bg"];
//    
//}
/**
 *  布局子控件
 */
-(void)layoutSubviews{
    

    NSArray *subItems = self.tabArray;

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

#pragma mark -lazy loading

-(NSArray *)tabArray{
    
    if(!_tabArray){
        
        _tabArray = self.subviews;
        
    }
    
    return _tabArray;
}

@end
