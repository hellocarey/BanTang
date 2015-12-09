//
//  BTTopic.h
//  BanTang
//
//  Created by User on 15/12/3.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface BTTopic : NSObject

@property (nonatomic, assign) BOOL islike;

@property (nonatomic, copy) NSString *update_time;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *likes;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *tags;

@end
