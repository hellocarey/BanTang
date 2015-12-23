//
//  BTAttentionBtn.m
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTAttentionBtn.h"

@implementation BTAttentionBtn

- (instancetype)initWithCoder:(NSCoder *)coder
{
    
    self = [super initWithCoder:coder];
    
    if (self) {
        
        self.layer.cornerRadius = 10;
        
        [self setTitleColor:systemRed forState:UIControlStateNormal];
        
        self.layer.masksToBounds = YES;
        
        self.layer.borderColor = systemRed.CGColor;
        
        self.layer.borderWidth = 0.5;
        
    }
    
    return self;
    
}
@end
