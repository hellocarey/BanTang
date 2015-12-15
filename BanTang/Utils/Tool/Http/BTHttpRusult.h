//
//  BTHttpRusult.h
//  BanTang
//
//  Created by User on 15/12/10.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BTHttpRusult : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger ts;

@property (nonatomic, strong) NSDictionary *data;

@property (nonatomic, copy) NSString *msg;

@end

