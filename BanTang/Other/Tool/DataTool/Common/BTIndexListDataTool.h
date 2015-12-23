//
//  BTIndexListDataTool.h
//  BanTang
//
//  Created by User on 15/12/21.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTShopList.h"
#import "BTEntry.h"
#import "BTBanner.h"

typedef void(^IndexListData)(NSMutableArray<BTShopList *> *productList , NSMutableArray<BTBanner *> *bannerList,NSMutableArray<BTEntry *> *entryList);

@interface BTIndexListDataTool : NSObject

/**获取首页的数据(清单,话题等数据)*/
+ (void)getIndexData:(IndexListData)indexListData withPage:(NSInteger)page withIsUp:(BOOL)isUp;


@end
