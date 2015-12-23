//
//  BTObject.h
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BTUser;

@interface BTObject : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *descriptionStr;

@property (nonatomic, copy) NSString *pic1;

@property (nonatomic, strong) BTUser *author;

@property (nonatomic, copy) NSString *datestr;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, copy) NSString *start_time;

@property (nonatomic, copy) NSString *rank_share_url;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *author_id;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *pic2;

@property (nonatomic, copy) NSString *is_recommend;

@end


