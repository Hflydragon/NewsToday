//
//  HomeCellModel.m
//  仿今日头条
//
//  Created by 黄feilong on 17/4/11.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "HomeCellModel.h"

@implementation HomeCellModel

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"desc":@"description"
             };
}

@end
