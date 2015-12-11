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

#define goodRequestUrl [requestURL stringByAppendingString:@"community/post/editorRec"]

#define loginRequestUrl [requestURL stringByAppendingString:@"user/login"]

#define userInfoRequestUrl [requestURL stringByAppendingString:@"users/likes/userInfo"]

#define subjectInfoRequestUrl [requestURL stringByAppendingString:@"community/subject/info"] 
//http://open3.bantangapp.com/	200	POST	open3.bantangapp.com	/community/subject/info	Fri Dec 11 21:47:27 CST 2015	896	6365	Complete