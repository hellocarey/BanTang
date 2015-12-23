//
//  BTProductList.h
//  BanTang
//
//  Created by User on 15/12/21.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTShopList : NSObject


/**清单的id */
@property (nonatomic, copy) NSString *ID;

/**清单的封面*/
@property (nonatomic, copy) NSString *pic;

/**清单的标题*/
@property (nonatomic, copy) NSString *title;

/**清单的喜欢数*/
@property (nonatomic, copy) NSString *likes;

/**清单的是否收藏*/
@property (nonatomic, copy) NSString *islikes;

/**清单的类型*/
@property (nonatomic, copy) NSString *type;
 
/**清单的标签列表（用字符串隔开）*/
@property (nonatomic, copy) NSString *tags;

/**清单的更新时间*/
@property (nonatomic, copy) NSString *updateTime;



@end
