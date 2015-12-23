//
//  BTProduct.h
//  BanTang
//
//  Created by User on 15/12/23.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BTDynamic,BTUser,BTTag,BTPic;

@interface BTProduct : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *relation_id;

@property (nonatomic, copy) NSString *is_recommend;

@property (nonatomic, strong) BTUser *author;

@property (nonatomic, copy) NSString *datestr;

@property (nonatomic, strong) NSArray<BTProduct *> *product;

@property (nonatomic, strong) NSArray<BTTag *> *tags;

@property (nonatomic, strong) BTDynamic *dynamic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *author_id;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *publish_time;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, copy) NSString *i_tags;

@property (nonatomic, strong) NSArray<BTPic *> *pics;

@property (nonatomic, copy) NSString *content;@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *category_id;

@property (nonatomic, copy) NSString *platform;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *item_id;

@property (nonatomic, copy) NSString *url;



@end

