//
//  NSString+NewToday.h
//  仿今日头条
//
//  Created by 黄feilong on 17/4/11.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NewToday)

+ (NSString *)rootUrl;

+ (NSString *)footUrl;

+ (NSString *)appendUrl:(NSString *)url;

@end
