//
//  BaseViewController.h
//  GFDouBanDemo
//
//  Created by 黄feilong on 16/11/7.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) BOOL enableUseInteractivePopGesture;

- (void)setUp;

- (void)useInteractivePopGesture;

- (void)pushViewController:(NSString *)viewControllerName;

- (void)popViewController;

- (void)popToRootViewController;

- (void)popToViewController:(NSString *)viewControllerName;

//开始刷新
- (void)tableViewRefresh:(UIScrollView *)scrollView Complent:(void(^)())block;
//开始加载更多
- (void)tableViewloadMoreData:(UIScrollView *)scrollView Complent:(void(^)())block;
//停止刷新
- (void)tableViewEndRefresh:(UIScrollView *)scrollView;
//停止
- (void)tableViewEndloadData:(UIScrollView *)scrollView;

@end
