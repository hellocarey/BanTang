//
//  BTHttpUtil.m
//  BanTang
//
//  Created by User on 15/12/3.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "BTHttpUtil.h"

@implementation BTHttpUtil

#pragma mark -请求http单例
+ (instancetype)shareHttpUtil{
    
    static BTHttpUtil *btHttpUtil = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        btHttpUtil = [[BTHttpUtil alloc] init];
    });
    
    return btHttpUtil;
}

#pragma mark -请求get，post 方法
- (void) POST:(NSString *)url parameters:(id)parameters success:(SuccessBlock) success failure:(FailureBlock)failure{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session POST:url parameters:[BTHttpUtil addParameters:parameters] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}

- (void) GET:(NSString *)url parameters:(id)parameters success:(SuccessBlock) success failure:(FailureBlock)failure{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session GET:url parameters:[BTHttpUtil addParameters:parameters] success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failure(error);
        
    }];
    
}

#pragma mark -添加参数 (静态数据，后期进行修改)
+ (NSDictionary *)addParameters:(NSDictionary *)dic{
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    [dictionary setValue:@"1449024710.437825" forKey:@"app_installtime"];
    
    [dictionary setValue:@"5.0" forKey:@"app_versions"];
    
    [dictionary setValue:@"appStore" forKey:@"channel_name"];
    
    [dictionary setValue:@"bt_app_ios" forKey:@"client_id"];
    
    [dictionary setValue:@"9c1e6634ce1c5098e056628cd66a17a5" forKey:@"client_secret"];
    
    [dictionary setValue:@"e39235ddf91f9180aea1785b4b6ec20d" forKey:@"oauth_token"];
    
    [dictionary setValue:@"9.1" forKey:@"os_versions"];
    
    [dictionary setValue:@"1242" forKey:@"screensize"];
    
    [dictionary setValue:@"iPhone8%2C2" forKey:@"track_device_info"];
    
    [dictionary setValue:@"5530DBEF-8B11-4E67-B7AB-13AD687ECFD" forKey:@"track_deviceid"];
    
    [dictionary setValue:@"1570743" forKey:@"track_user_id"];
    
    [dictionary setValue:@"8" forKey:@"v"];
    
    [dictionary addEntriesFromDictionary:dic];
    
    return [dictionary copy];
    
}

@end
