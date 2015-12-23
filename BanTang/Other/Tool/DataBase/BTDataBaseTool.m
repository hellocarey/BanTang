//
//  BTDataBaseTool.m
//  BanTang
//
//  Created by User on 15/12/22.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTDataBaseTool.h"

#define dataBasePath [[(NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)) lastObject]stringByAppendingPathComponent:dataBaseName]

#define dataBaseName @"BTData.sqlite"


static FMDatabase *sharedDBSigleton = nil;

@implementation BTDataBaseTool

+ (void)load{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        if(sharedDBSigleton ==nil){
            
            sharedDBSigleton =[FMDatabase databaseWithPath:dataBasePath];
            
            [sharedDBSigleton open];
            
        }
        
    });

}



// 删除表
+ (BOOL) deleteTable:(NSString *)tableName
{
    BOOL state = NO;

    NSString *sqlstr = [NSString stringWithFormat:@"DROP TABLE %@", tableName];
    
    if ([sharedDBSigleton executeUpdate:sqlstr])
    {
        
        state = YES;
        
    }

    return state;
}

//删除表所有数据
+(BOOL) deleteTableData:(NSString *)tableName
{
    BOOL state = NO;
 
    NSString *sqlstr = [NSString stringWithFormat:@"DELETE FROM %@", tableName];
    
    if ([sharedDBSigleton executeUpdate:sqlstr])
    {
        
        state = YES;
        
    }
    
    return state;
}

//根据表的名字判断表是否存在
+ (BOOL)isTableExistWithTableName:(NSString *)tableName
{
    
    FMResultSet *set = [sharedDBSigleton executeQuery:@"select count(*) as count from sqlite_master where type = 'table' and name = ?",tableName];
    
    if ([set next]) {
        
        NSInteger count = [set intForColumn:@"count"];
        
        if (0 == count) {
            
            return NO;
            
        }
    }
        return YES;
    
    return NO;
}



+ (void)saveItemDict:(NSDictionary *)dic tableName:(NSString *)tableName
{
    
    NSData *dictData = [NSKeyedArchiver archivedDataWithRootObject:dic];

   [sharedDBSigleton executeUpdate:[NSString stringWithFormat:@"INSERT INTO %@ (id, dic) VALUES (?,?)",tableName],dic[@"id"],dictData];
    
}

+ (NSMutableArray *)list:(Class)class {
    
    FMResultSet *set = [sharedDBSigleton executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@",NSStringFromClass(class)]];
    
    NSMutableArray *list = [NSMutableArray array];
    
    while (set.next) {
        
        // 获得当前所指向的数据
        NSData *dictData = [set objectForColumnName:@"dic"];
        
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:dictData];
        
        [list addObject:[class mj_objectWithKeyValues:dict]];
        
    }
    
    return list;
}

+ (NSMutableArray *)listWithRange:(NSRange)range class:(Class)class{
    
    NSString *SQL = [NSString stringWithFormat:@"SELECT * FROM %@ LIMIT %lu, %lu",NSStringFromClass(class),range.location, range.length];
    
    FMResultSet *set = [sharedDBSigleton executeQuery:SQL];
    
    NSMutableArray *list = [NSMutableArray array];
    
    while (set.next) {
        
        // 获得当前所指向的数据
        NSData *dictData = [set objectForColumnName:@"dic"];
        
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:dictData];
        
        [list addObject:[class mj_objectWithKeyValues:dict]];
        
    }
    
    return list;
    
}

+ (BOOL)isExistWithId:(NSString *)idStr tableName:(NSString *)tableName
{
    
    if (![BTDataBaseTool isTableExistWithTableName:tableName ] ) {
        
        NSInteger count = [sharedDBSigleton executeUpdate:[NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id text ,dic blob NOT NULL)",tableName]];
        
        NSLog(@"%zd",count);
        
    }
    
    BOOL isExist = NO;

    FMResultSet *resultSet= [sharedDBSigleton executeQuery:[NSString stringWithFormat:@"SELECT * FROM %@ where id = ? ",tableName],idStr];
    
    while ([resultSet next]) {
        
        if([resultSet stringForColumn:@"id"]) {
            isExist = YES;
        }else{
            isExist = NO;
        }
        
    }
    
    return isExist;
    
}

@end

