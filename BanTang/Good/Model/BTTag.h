//
//  BTTag.h
//  BanTang
//
//  Created by User on 15/12/11.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BTTag : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *en_name;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSMutableArray *subclass;

@end
