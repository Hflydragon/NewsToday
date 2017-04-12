//
//  HDZCustomSliderVC.h
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/24.
//  Copyright © 2016年 feilong. All rights reserved.
//  滑动内容控制器

#import "BaseViewController.h"

@protocol HDZCustomSliderVCDelegate <NSObject>
//在控制器中有多少个子控制器
- (NSInteger)numberOfChildVCInCustomSliderVC;
//当手势滑动时上方的标题滑动栏跟着滑动
- (void)customSliderDidScroll:(UIScrollView *)scroll andSegmentPage:(NSInteger)page;
//第一个自控制器reload数据
- (NSString *)firstControllerData;

@end

@interface HDZCustomSliderVC : BaseViewController

@property (nonatomic,weak)id <HDZCustomSliderVCDelegate> delegate;

@property (nonatomic,assign)NSInteger selectIndex;
//包含的子控制器
@property (nonatomic,strong)NSArray *childViewControllersArray;
//传递标题数组
-(void)setUpTitleArray:(NSArray *)array;
//刷新
- (void)reloadData;
@end
