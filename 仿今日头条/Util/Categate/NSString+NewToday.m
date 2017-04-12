//
//  NSString+NewToday.m
//  仿今日头条
//
//  Created by 黄feilong on 17/4/11.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "NSString+NewToday.h"

@implementation NSString (NewToday)

+ (NSString *)rootUrl{
    return @"https://api.tianapi.com/";
}

+ (NSString *)footUrl
{
    return @"/?key=3e61c9bf1c94fe3794ee59e0c87589c4&num=10";
}

+ (NSString *)appendUrl:(NSString *)url
{
    return [[[self rootUrl] stringByAppendingString:url] stringByAppendingString:[self footUrl]];
}

@end
