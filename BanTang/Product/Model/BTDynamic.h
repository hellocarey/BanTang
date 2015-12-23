//
//  BTDynamic.h
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTDynamic : NSObject

@property (nonatomic, copy) NSString *comments;

@property (nonatomic, strong) NSArray *likes_users;

@property (nonatomic, assign) BOOL is_comment;

@property (nonatomic, copy) NSString *praises;

@property (nonatomic, copy) NSString *views;

@property (nonatomic, copy) NSString *likes;

@property (nonatomic, assign) BOOL is_collect;

@end
