//
//  TodayTool.m
//  仿今日头条
//
//  Created by 黄feilong on 17/4/10.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "TodayTool.h"

@implementation TodayTool

//创建单例
+ (instancetype)shareTool
{
    static TodayTool *tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[TodayTool alloc] init];
    });
    return tool;
}


- (void)toolGet:(NSString *)url paramskey:(NSDictionary *)params success:(result)responce Fail:(fail)failMsg
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(responce){
            responce(responseObject[@"newslist"],YES,nil);
        }
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failMsg){
            failMsg([error description],200);
        }
    }];
}

- (void)toolPost:(NSString *)url paramskey:(NSDictionary *)params success:(result)responce Fail:(fail)failMsg
{
    
}

@end
