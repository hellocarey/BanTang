//
//  BTTopic.h
//  BanTang
//
//  Created by User on 15/12/3.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
@class BTUser;
@interface BTTopic : NSObject

@property (nonatomic, assign) BOOL islike;

@property (nonatomic, copy) NSString *update_time;

/**单品的id */
@property (nonatomic, copy) NSString *ID;

/**图片*/
@property (nonatomic, copy) NSString *pic;

/**标题*/
@property (nonatomic, copy) NSString *title;

/**喜欢数*/
@property (nonatomic, copy) NSString *likes;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *tags;

/**价格*/
@property (nonatomic, copy) NSString *price;

/**单品描述*/
@property (nonatomic, copy) NSString *desc;

/**单品发布者*/
@property (nonatomic, copy) BTUser *user;

@end
