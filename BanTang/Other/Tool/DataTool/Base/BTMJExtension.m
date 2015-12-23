//
//  BTMJExtension.m
//  BanTang
//
//  Created by User on 15/12/14.
//  Copyright © 2015年 LJ. All rights reserved.
//
#import "BTProduct.h"
#import "BTMJExtension.h"
#import "BTProduct.h"
#import "BTTag.h"
#import "BTPic.h"
#import "BTObject.h"
#import "BTEntry.h"
#import "BTTopic.h"
#import "BTShopList.h"
#import "BTBanner.h"

@implementation BTMJExtension

+ (void)load{

    [BTProduct mj_setupObjectClassInArray:^NSDictionary *{
        
         return @{@"product" : [BTProduct class], @"tags" : [BTTag class], @"pics" : [BTPic class]};
        
    }];
    
    [BTTag mj_setupObjectClassInArray:^NSDictionary *{
        
         return @{@"subclass" : [BTTag class]};
        
    }];
    
    [BTObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        
         return @{@"descriptionStr":@"description"};
        
    }];

    [BTEntry mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        
         return @{@"extend_id":@"extend"};
        
    }];
    
    NSArray *array = @[[BTBanner class],[BTShopList class],[BTTopic class],[BTEntry class],[BTTag class]];
 
    for (Class class in array) {
        
        [class mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            
            return @{@"ID":@"id"};
            
        }];
        
    }
}

@end
