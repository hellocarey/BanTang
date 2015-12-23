//
//  BTIndexListDataTool.m
//  BanTang
//
//  Created by User on 15/12/21.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTIndexListDataTool.h"
#import "BTHttpUtil.h"
#import "BTModelTool.h"
#import "BTDataBaseTool.h"

@implementation BTIndexListDataTool


/**获取首页的数据(清单,话题等数据)*/
+ (void)getIndexData:(IndexListData)indexListData withPage:(NSInteger)page withIsUp:(BOOL)isUp{
    
    [BTHttpUtil checkNetworkStatus:^(BOOL result) {
        
        if(result){
            
            if(isUp){
                
                [BTIndexListDataTool deleteData];
                
            }
            
            [[BTHttpUtil shareHttpUtil] GET:homeRequestUrl parameters:@{ @"page":@(page) , @"pagesize":[NSString stringWithFormat:@"%zd",PAGESIZE] } success:^(id responseObject) {
                
                indexListData([BTModelTool modelMultiTransformationWithResponseObj:responseObject[@"topic"] modelClass:[BTShopList class]],[BTModelTool modelMultiTransformationWithResponseObj:responseObject[@"banner"] modelClass:[BTBanner class]],[BTModelTool modelMultiTransformationWithResponseObj:responseObject[@"entry_list"] modelClass:[BTEntry class]]);
                
                
            } failure:^(id responseObject) {
                
            }];
            
        }else{
            
            [self loadLocalData:indexListData page:NSMakeRange(page*PAGESIZE, page*PAGESIZE+PAGESIZE)];
        }
        
    }];

}

+ (void)loadLocalData:(IndexListData)indexListData page:(NSRange)range{
 
    indexListData([BTDataBaseTool listWithRange:range class:[BTShopList class]],[BTDataBaseTool list:[BTBanner class]],[BTDataBaseTool list:[BTEntry class]]);
    
}

+ (void)deleteData{

    [BTDataBaseTool deleteTableData:NSStringFromClass([BTShopList class])];
    
    [BTDataBaseTool deleteTableData:NSStringFromClass([BTBanner class])];
    
    [BTDataBaseTool deleteTableData:NSStringFromClass([BTEntry class])];
    
}

@end
