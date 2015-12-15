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

#define sceneRequestUrl [requestURL stringByAppendingString:@"category/scene"]

#define getTopicByIdUrl [requestURL stringByAppendingString:@"topic/newInfo"]

#define goodRequestUrl [requestURL stringByAppendingString:@"community/post/editorRec"]

#define loginRequestUrl [requestURL stringByAppendingString:@"user/login"]

#define userInfoRequestUrl [requestURL stringByAppendingString:@"users/likes/userInfo"]

#define subjectInfoRequestUrl [requestURL stringByAppendingString:@"community/subject/info"]

#define categoryListRequestUrl [requestURL stringByAppendingString:@"category/list"]

#define topListRequestBySceneId [requestURL stringByAppendingString:@"topic/list"] 

#define productListRequest [requestURL stringByAppendingString:@"product/productList"] 