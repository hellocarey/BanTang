//
//  UIImageView+Extension.m
//  BanTang
//
//  Created by User on 15/12/14.
//  Copyright © 2015年 LJ. All rights reserved.
//

#import "UIImageView+Extension.h"
#import "UIImage+Image.h"

@implementation UIImageView (Extension)

- (void)setHeader:(NSString *)url{
    
    [self setCircleHeader:url];
    
}

- (void)setNetImg:(NSString *)url{
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageWithColor:systemDrakGray]];
    
}

- (void)setCircleHeader:(NSString *)url{
    
    BTWeakSelf;
    
    UIImage *placeholder = [[UIImage imageNamed:@"user_default"] circleImage];
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:
     ^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
         
         if (image == nil) return;
         
         weakSelf.image = [image circleImage];
         
     }];
    
}

@end
