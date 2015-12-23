//
//  BTProductListDataTool.h
//  BanTang
//
//  Created by User on 15/12/21.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTShopList.h"
typedef void(^ShopListData)(NSMutableArray<BTShopList *> *productList);
typedef void(^ShopListCategoryData)(NSMutableArray<BTShopList *> *productList);

@interface BTShopListDataTool : NSObject

/**根据页码获取清单的列表*/
+ (void)shopListData:(NSInteger)page shopList:(ShopListData)shopList;

/**查询清单分类列表*/
+ (void)shopListCategoryData:(ShopListCategoryData)shopListCategoryData;

@end
