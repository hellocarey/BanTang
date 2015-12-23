//
//  BTProductListDataTool.m
//  BanTang
//
//  Created by User on 15/12/21.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTShopListDataTool.h"
#import "BTShopList.h"
#import "BTDataBaseTool.h"
#import "BTTag.h"

@implementation BTShopListDataTool


+ (void)shopListData:(NSInteger)page shopList:(ShopListData)shopList{
    
    [[BTHttpUtil shareHttpUtil] GET:[requestURL stringByAppendingString:@"recommend/topList"] parameters:@{ @"page":@(page) , @"pagesize":[NSString stringWithFormat:@"%zd",PAGESIZE] } success:^(id responseObject) {

        shopList([BTShopList mj_objectArrayWithKeyValuesArray:responseObject[@"topic"]]);
        
    } failure:^(id responseObject) {
        
        
    }];
    
}

+ (void)shopListCategoryData:(ShopListCategoryData)shopListCategoryData{
    
    [BTHttpUtil checkNetworkStatus:^(BOOL result) {
        
        if(result){
            
            [[BTHttpUtil shareHttpUtil] POST:sceneRequestUrl parameters:nil success:^(id responseObject) {
            
                shopListCategoryData(responseObject);
                
            } failure:^(id responseObject) {
                
            }];
            
        }else{
            
            [self loadLocalShopListCategoryData:shopListCategoryData];
        }
        
    }];

}

+ (void)loadLocalShopListCategoryData:(ShopListCategoryData)shopListCategoryData{
    
    shopListCategoryData([BTDataBaseTool list:[BTTag class]]);
    
}

@end

