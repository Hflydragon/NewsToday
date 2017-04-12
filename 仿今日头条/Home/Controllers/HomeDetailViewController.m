//
//  HomeDetailViewController.m
//  仿今日头条
//
//  Created by 黄feilong on 17/4/11.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "HomeTableViewCell.h"
#import "WebViewController.h"
#import "HomeCellModel.h"
#import "NewStatusView.h"

static NSString *HomeCellId = @"HomeCell";

@interface HomeDetailViewController () 

@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUpTableView];
    
    
}
/**
 设置tableView
 */
- (void)setUpTableView
{
    self.tableView.frame = CGRectMake(0, 0, self.view.width,self.view.height-49 - 64 - 40);
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeTableViewCell class]) bundle:nil] forCellReuseIdentifier:HomeCellId];
    [self.view addSubview:self.tableView];
    
    WS(self)
    
    [self tableViewRefresh:self.tableView Complent:^{
        weakSelf.page = 1;
        [weakSelf.dataArray removeAllObjects];
        [weakSelf.tableView reloadData];
        [weakSelf setHttps:weakSelf.page];
    }];
    
    [self tableViewloadMoreData:self.tableView Complent:^{
        weakSelf.page++;
        [weakSelf setHttps:weakSelf.page];
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeCellId];;
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    HomeCellModel *model = self.dataArray[indexPath.row];
    WebViewController *web = [[WebViewController alloc] init];
    web.url = model.url;
    web.titleN = model.title;
    [self.navigationController pushViewController:web animated:YES];
}

//添加
- (void)addNewStatus
{
    NewStatusView *new = [NewStatusView showNews:@"10"];
    new.center = CGPointMake(self.width/2, 15);
    [self.view addSubview:new];
}

@end
