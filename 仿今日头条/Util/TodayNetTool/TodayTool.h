//
//  TodayTool.h
//  仿今日头条
//
//  Created by 黄feilong on 17/4/10.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^result)(id responceObject,BOOL success,NSString *message);

typedef void (^fail)(NSString *message,NSInteger code);

@interface TodayTool : NSObject

+ (instancetype)shareTool;

- (void)toolGet:(NSString *)url paramskey:(NSDictionary *)params success:(result)responce Fail:(fail)failMsg;

- (void)toolPost:(NSString *)url paramskey:(NSDictionary *)params success:(result)responce Fail:(fail)failMsg;

@end
