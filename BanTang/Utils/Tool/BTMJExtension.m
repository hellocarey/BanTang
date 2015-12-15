//
//  BTMJExtension.m
//  BanTang
//
//  Created by User on 15/12/14.
//  Copyright © 2015年 LJ. All rights reserved.
//
#import "BTGood.h"
#import "BTMJExtension.h"
#import "BTProduct.h"
#import "BTTag.h"
#import "BTPic.h"
#import "BTObject.h"
#import "BTEntry.h"
#import "BTTopic.h"

@implementation BTMJExtension

+ (void)load{

    [BTGood mj_setupObjectClassInArray:^NSDictionary *{
        
         return @{@"product" : [BTProduct class], @"tags" : [BTTag class], @"pics" : [BTPic class]};
        
    }];
    
    [BTTag mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        
         return @{@"ID":@"id"};
        
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
    
    [BTTopic mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        
        return @{@"ID":@"id"};
        
    }];

}

@end
