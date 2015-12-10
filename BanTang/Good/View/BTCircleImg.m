//
//  BTCircleImg.m
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTCircleImg.h"

@implementation BTCircleImg

- (instancetype)initWithCoder:(NSCoder *)coder
{
    
    self = [super initWithCoder:coder];
    
    if (self) {
        
        self.layer.cornerRadius = self.width*0.5;
        
        self.layer.masksToBounds = YES;
        
    }
    
    return self;
    
}

@end
