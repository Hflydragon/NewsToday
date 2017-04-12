//
//  HomeBaseViewController.h
//  仿今日头条
//
//  Created by 黄feilong on 17/4/11.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeBaseViewController : BaseViewController <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,copy)NSMutableArray *dataArray;

@property (nonatomic,assign)NSInteger index;

@property (nonatomic,assign)NSInteger page;

- (void)setHttps:(NSInteger)page;

//添加
- (void)addNewStatus;

@end
