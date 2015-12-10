//
//  BTUser.h
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTUser : NSObject

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger is_official;

@property (nonatomic, copy) NSString *username;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, assign) NSInteger attention_type;

@property (nonatomic, copy) NSString *user_cover;

@end
