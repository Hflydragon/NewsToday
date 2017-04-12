//
//  HomeCellModel.h
//  仿今日头条
//
//  Created by 黄feilong on 17/4/11.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeCellModel : NSObject
//ctime = "2017-03-27";
//description = "\U77e5\U5bb6";
//picUrl = "http://mmbiz.qpic.cn/mmbiz_jpg/AnpHrdpe5icQcL58c1z2AoA7hQaniaQfM1oTRIGzSov6DsESciaENV26UhrjUntZvrdABfGDN2DTzPgp32u56rJJA/0?wx_fmt=jpeg";
//title = "\U8c01\U8bf4\U53ea\U6709\U4f1a\U8ba1\U624d\U80fd\U7ba1\U8d22\U52a1\Uff1f\U8fd9\U5bb6\U516c\U53f8\U5c31\U662f\U8981\U8ba9\U4efb\U4f55\U4eba\U90fd\U80fd\U7ba1\U7406\U8d22\U52a1";
//url = "http://mp.weixin.qq.com/s/IbLxiJOUbimZjwAmlO716Q";

@property (nonatomic,copy)NSString *ctime;

@property (nonatomic,copy)NSString *desc;

@property (nonatomic,copy)NSString *picUrl;

@property (nonatomic,copy)NSString *title;

@property (nonatomic,copy)NSString *url;

@end
