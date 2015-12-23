//
//  BTModelTool.h
//  BanTang
//
//  Created by User on 15/12/22.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTModelTool : NSObject

/**字典数组转模型数组*/
+ (NSMutableArray *)modelMultiTransformationWithResponseObj:(id)responseObj modelClass:(Class)modelClass;

/**字典转模型*/
+ (NSDictionary *)modelTransformationWithResponseObj:(id)responseObj modelClass:(Class)modelClass;

@end
