//
//  HomeTableViewCell.h
//  仿今日头条
//
//  Created by 黄feilong on 17/4/11.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeCellModel;
@interface HomeTableViewCell : UITableViewCell

@property (nonatomic,strong)HomeCellModel *model;

+(instancetype)cell;

@end
