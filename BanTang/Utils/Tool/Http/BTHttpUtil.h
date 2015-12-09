//
//  BTHttpUtil.h
//  BanTang
//
//  Created by User on 15/12/3.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailureBlock)(id responseObject);

@interface BTHttpUtil : NSObject

+ (instancetype)shareHttpUtil;

- (void) POST:(NSString *)url parameters:(id)parameters success:(SuccessBlock) success failure:(FailureBlock)failure;

- (void) GET:(NSString *)url parameters:(id)parameters success:(SuccessBlock) success failure:(FailureBlock)failure;


@end
