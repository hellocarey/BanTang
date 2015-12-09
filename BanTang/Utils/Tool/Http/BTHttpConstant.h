//
//  BTHttpConstant.h
//  BanTang
//
//  Created by User on 15/12/3.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define requestURL @"http://open3.bantangapp.com/"

#define homeRequestUrl [requestURL stringByAppendingString:@"recommend/index"]

#define getTopicByIdUrl [requestURL stringByAppendingString:@"topic/newInfo"]