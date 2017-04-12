//
//  HomeBaseViewController.m
//  仿今日头条
//
//  Created by 黄feilong on 17/4/11.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "HomeBaseViewController.h"
#import "HomeCellModel.h"
#import "APIModel.h"

@interface HomeBaseViewController ()

@end

@implementation HomeBaseViewController

- (UITableView *)tableView
{
    if(_tableView == nil){
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 100;
    }
    return _tableView;
}

-(NSMutableArray *)dataArray
{
    if(_dataArray == nil){
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@""];
    return cell;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.dataArray removeAllObjects];
    [self setHttps:self.page];
}

- (void)setHttps:(NSInteger)page
{
    if (page==0) page = 1;
    NSDictionary *params = @{
                             @"page":@(page)
                             };
    WS(self)
    [[TodayTool shareTool] toolGet:[APIModel apiArray][self.index] paramskey:params success:^(id responceObject, BOOL success, NSString *message) {
        [weakSelf tableViewEndRefresh:weakSelf.tableView];
        [weakSelf tableViewEndloadData:weakSelf.tableView];
        for (NSDictionary *dict in responceObject) {
            [weakSelf.dataArray addObject:[HomeCellModel modelWithJSON:dict]];
        }
        [weakSelf.tableView reloadData];
        [weakSelf addNewStatus];
        
    } Fail:^(NSString *message, NSInteger code) {
        [weakSelf tableViewEndRefresh:weakSelf.tableView];
        [weakSelf tableViewEndloadData:weakSelf.tableView];
    }];
}

- (void)addNewStatus
{
}

@end
