//
//  BTGood.h
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BTDynamic,BTUser,BTProduct,BTTag,BTPic;
@interface BTGood : NSObject

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

@property (nonatomic, copy) NSString *content;

@end




