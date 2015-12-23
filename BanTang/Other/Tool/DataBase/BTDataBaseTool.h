//
//  BTDataBaseTool.h
//  BanTang
//
//  Created by User on 15/12/22.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
@interface BTDataBaseTool : NSObject


// 删除表
+ (BOOL) deleteTable:(NSString *)tableName;

//删除表所有数据
+ (BOOL) deleteTableData:(NSString *)tableName;

//根据表名和id判断是否存在
+ (BOOL)isExistWithId:(NSString *)idStr tableName:(NSString *)tableName;

//根据表名和字典存入数据
+ (void)saveItemDict:(NSDictionary *)dic tableName:(NSString *)tableName;

//分页数据库读本地数据
+ (NSMutableArray *)list:(Class)class;

//分页数据库读本地数据
+ (NSMutableArray *)listWithRange:(NSRange)range class:(Class)class;

@end
