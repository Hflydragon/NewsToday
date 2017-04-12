//
//  HeadView.m
//  仿今日头条
//
//  Created by 黄feilong on 17/4/10.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "HeadView.h"
#import "PYSearch.h"
#import "TodayNavViewController.h"
#import "BaseViewController.h"

@interface HeadView () <UISearchBarDelegate,PYSearchViewControllerDelegate>

@end

@implementation HeadView
{
    startTap _block;
    UIViewController *_controller;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        // 创建搜索框
        UIView *titleView = [[UIView alloc] init];
        titleView.left = 0;
        titleView.top = 0;
        titleView.width = frame.size.width;
        titleView.height = 64;
        [self addSubview:titleView];
        UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(titleView.width/3+20, 27, titleView.width*2/3 - 40, 30)];
        searchBar.placeholder = @"您要的才是头条";
        searchBar.backgroundImage = [UIImage imageNamed:@"PYSearch.bundle/clearImage"];
        searchBar.delegate = self;
        [titleView addSubview:searchBar];
        
        
        UIImage *image = [UIImage imageNamed:@"toutiao"];
        UIImageView *imageV = [[UIImageView alloc] init];
        imageV.frame = CGRectMake(20, 27, titleView.width/3-20, 30);
        imageV.image = image;
        imageV.contentMode = UIViewContentModeScaleAspectFit;
        [titleView addSubview:imageV];
        
    }
    return self;
}

- (void)startOberser:(startTap)block withController:(UIViewController *)controller
{
    _block = block;
    _controller = controller;
}

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    _block(self);
    return NO;
}


//搜索
- (void)toSearchController
{
    // 1.创建热门搜索
    NSArray *hotSeaches = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    // 2. 创建控制器
    PYSearchViewController *searchViewController = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"搜索编程语言" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        // 开始搜索执行以下代码
        // 如：跳转到指定控制器
        [searchViewController.navigationController pushViewController:[[BaseViewController alloc] init] animated:YES];
    }];
    // 3. 设置风格
    searchViewController.hotSearchStyle = PYHotSearchStyleNormalTag; // 热门搜索风格根据选择
    searchViewController.searchHistoryStyle = PYHotSearchStyleDefault; // 搜索历史风格为default
    // 4. 设置代理
    searchViewController.delegate = self;
    // 5. 跳转到搜索控制器
    TodayNavViewController *nav = [[TodayNavViewController alloc] initWithRootViewController:searchViewController];
    [_controller presentViewController:nav  animated:NO completion:nil];
}

@end
