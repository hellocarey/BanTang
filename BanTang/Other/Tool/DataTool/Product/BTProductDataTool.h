//
//  BTProductDataTool.h
//  BanTang
//
//  Created by User on 15/12/22.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTProduct.h"
#import "BTEntry.h"

typedef void(^ProductData)(NSMutableArray<BTProduct *> *product,NSMutableArray<BTEntry *> *entry);
typedef void(^ProductListData)(NSMutableArray<BTProduct *> *product);
typedef void(^ProductTagData)(NSMutableArray<BTTag *> *product);
@interface BTProductDataTool : NSObject

/**根据页码获取单品的列表*/
+ (void)productListData:(NSInteger)page withIsUp:(BOOL)isUp productList:(ProductData)productlist;

/**查询单品分类列表*/
+ (void)productCategoryListData:(ProductTagData)productTag;

/**根据分类的id查询单品分类列表*/
+ (void)productListDataByTagId:(NSInteger)page withSubclass:(NSString *)subclass withIsUp:(BOOL)isUp productList:(ProductListData)productlist;

@end
