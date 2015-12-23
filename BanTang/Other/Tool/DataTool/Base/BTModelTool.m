//
//  BTModelTool.m
//  BanTang
//
//  Created by User on 15/12/22.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTModelTool.h"
#import <MJExtension/MJExtension.h>
#import "BTDataBaseTool.h"
@implementation BTModelTool


+ (NSMutableArray *)modelMultiTransformationWithResponseObj:(id)responseObj modelClass:(Class)modelClass{

    NSMutableArray *array = [NSMutableArray array];
    
    NSString *className = NSStringFromClass(modelClass);

    for (NSDictionary *dic in responseObj) {
        
        [array addObject:[modelClass mj_objectWithKeyValues:dic]];
        
        if (![BTDataBaseTool isExistWithId:dic[@"id"] tableName:className]) {

            [BTDataBaseTool saveItemDict:dic tableName:className];
            
        }
        
    }

    return array;
    
}

///**字典转模型*/
+ (NSDictionary *)modelTransformationWithResponseObj:(id)responseObj modelClass:(Class)modelClass{
    
    NSString *className = NSStringFromClass(modelClass);

    NSDictionary *dic = [modelClass mj_objectWithKeyValues:responseObj];
    
    if (![BTDataBaseTool isExistWithId:dic[@"id"] tableName:className]) {
        
        [BTDataBaseTool saveItemDict:dic tableName:className];
        
    }

    return dic;
}


@end
