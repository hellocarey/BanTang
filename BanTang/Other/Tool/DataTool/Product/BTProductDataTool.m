//
//  BTProductDataTool.m
//  BanTang
//
//  Created by User on 15/12/22.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTProductDataTool.h"
#import "BTHttpUtil.h"
#import "BTModelTool.h"
#import "BTDataBaseTool.h"
#import "BTTag.h"

@implementation BTProductDataTool

/**根据页码获取单品的列表*/
+ (void)productListData:(NSInteger)page withIsUp:(BOOL)isUp productList:(ProductData)productData {
    
    [BTHttpUtil checkNetworkStatus:^(BOOL result) {
        
        if(result){
            
            if(isUp){
                
                [BTProductDataTool deleteData];
                
            }
            
            [[BTHttpUtil shareHttpUtil] POST:goodRequestUrl parameters:@{@"page":[NSString stringWithFormat:@"%zd",@(page)],@"pagesize":@"10"} success:^(id responseObject) {
                
                productData([BTModelTool modelMultiTransformationWithResponseObj:responseObject[@"list"] modelClass:[BTProduct class]],[BTModelTool modelMultiTransformationWithResponseObj:responseObject[@"element"] modelClass:[BTEntry class]]);
    
            } failure:^(id responseObject) {
                
            }];
            
        }else{
            
            [self loadLocalData:productData page:NSMakeRange(page*PAGESIZE, page*PAGESIZE+PAGESIZE)];
        }
        
    }];

}

+ (void)loadLocalData:(ProductData)productData  page:(NSRange)range{
    
    productData([BTDataBaseTool listWithRange:range class:[BTProduct class]],[BTDataBaseTool list:[BTEntry class]]);
    
}

+ (void)deleteData{
    
    [BTDataBaseTool deleteTableData:NSStringFromClass([BTProduct class])];
    
}


+ (void)productCategoryListData:(ProductTagData)productTag{
    
    [BTHttpUtil checkNetworkStatus:^(BOOL result) {
        
        if(result){
            
            [[BTHttpUtil shareHttpUtil] POST:categoryListRequestUrl parameters:@{@"is_new":@"1"} success:^(id responseObject) {
                
                productTag([BTModelTool modelMultiTransformationWithResponseObj:responseObject modelClass:[BTTag class]]);
                
            } failure:^(id responseObject) {
                
            }];
            
        }else{
            
            [self loadLocalProductCategoryData:productTag];
        }
        
    }];
    
}

+ (void)loadLocalProductCategoryData:(ProductTagData)productData{
    
    productData([BTDataBaseTool list:[BTTag class]]);
    
}

+ (void)productListDataByTagId:(NSInteger)page withSubclass:(NSString *)subclass withIsUp:(BOOL)isUp productList:(ProductListData)productlist{
    
    [BTHttpUtil checkNetworkStatus:^(BOOL result) {
        
    if(result){
            
        if(isUp){
            
            [BTProductDataTool deleteData];
            
        }
        
            [[BTHttpUtil shareHttpUtil] GET:productListRequest parameters:@{ @"subclass": subclass,@"page":[NSString stringWithFormat:@"%zd",page], @"pagesize":[NSString stringWithFormat:@"%zd",PAGESIZE] } success:^(id responseObject) {
                
                productlist([BTModelTool modelMultiTransformationWithResponseObj:responseObject[@"list"]modelClass:[BTProduct class]]);
                
            } failure:^(id responseObject) {
                
                
            }];
        }else{
            
            [self loadLocalProductListData:productlist page:NSMakeRange(page*PAGESIZE, page*PAGESIZE+PAGESIZE)];
            
        }
        
    }];
    
}

+ (void)loadLocalProductListData:(ProductListData)productlist  page:(NSRange)range{
    
    //productlist([BTDataBaseTool listWithRange:range class:[BTProduct class]]);
    
}

@end
