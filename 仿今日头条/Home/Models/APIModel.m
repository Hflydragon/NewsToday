//
//  APIModel.m
//  仿今日头条
//
//  Created by 黄feilong on 17/4/11.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "APIModel.h"
#import "NSString+NewToday.h"

@implementation APIModel

+ (NSArray *)apiSource
{
    return @[@"social",@"guonei",@"world",@"huabian",@"tiyu",@"nba",@"football",@"keji",@"startup",@"apple",@"mobile",@"travel",@"health",@"qiwen",@"meinv",@"vr",@"it"];
}

+ (NSArray *)titleArray
{
    return @[@"社会",@"国内",@"国际",@"娱乐",@"体育",@"NBA",@"足球",@"科技",@"创业",@"苹果",@"移动互联",@"旅游资讯",@"健康知识",@"奇闻异事",@"美女图片",@"VR科技",@"IT咨询"];
}

+ (NSArray *)apiArray
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self apiSource].count];
    for (NSString *url in [self apiSource]) {
        [array addObject:[NSString appendUrl:url]];
    }
    return array;
}

@end
