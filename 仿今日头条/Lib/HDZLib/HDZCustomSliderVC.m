//
//  HDZCustomSliderVC.m
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/24.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import "HDZCustomSliderVC.h"
#define Kwidth [UIScreen mainScreen].bounds.size.width

#define Keight [UIScreen mainScreen].bounds.size.height

@interface HDZCustomSliderVC () <UIScrollViewDelegate>

@property (nonatomic,weak)UIScrollView *scrollView;

@property (nonatomic,strong)NSMutableDictionary *memoryCache;

@property (nonatomic,strong)NSMutableDictionary *displayVC;

@end

@implementation HDZCustomSliderVC
{
    NSArray *_titleArray;
}

//懒加载
- (UIScrollView *)scrollView
{
    if(_scrollView == nil){
        UIScrollView *scroll = [[UIScrollView alloc] init];
        scroll.frame = self.view.bounds;
//        scroll.backgroundColor = [UIColor lightGrayColor];
        scroll.showsVerticalScrollIndicator  = NO;
        scroll.showsHorizontalScrollIndicator = NO;
        scroll.delegate = self;
        scroll.pagingEnabled = YES;
        scroll.bounces = NO;
        [self.view addSubview:scroll];
        _scrollView = scroll;
    }
    return _scrollView;
}

-(void)setChildViewControllersArray:(NSArray *)childViewControllersArray
{
    _childViewControllersArray = [childViewControllersArray copy];
}

- (NSMutableDictionary *)displayVC {
    if (!_displayVC) {
        _displayVC = [[NSMutableDictionary alloc] init];
    }
    return _displayVC;
}

- (NSMutableDictionary *)memoryCache {
    if (!_memoryCache) {
        _memoryCache = [[NSMutableDictionary alloc] init];
    }
    return _memoryCache;
}

-(void)setUpTitleArray:(NSArray *)array
{
    _titleArray = array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor grayColor];
    
    self.scrollView.contentSize = CGSizeMake([self childViewControllersNumber], self.view.frame.size.height);
    
}

- (void)reloadData {
    
    [self.memoryCache removeAllObjects];
    [self.displayVC removeAllObjects];
    
    for (NSInteger index = 0; index < self.childViewControllers.count; index++) {
        UIViewController *viewController = self.childViewControllers[index];
        [viewController.view removeFromSuperview];
        [viewController willMoveToParentViewController:nil];
        [viewController removeFromParentViewController];
    }
    
    self.scrollView.frame = self.view.bounds;
    self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * [self childViewControllersNumber], self.scrollView.frame.size.height);
    [self scrollViewDidScroll:self.scrollView];
}

-(void)setSelectIndex:(NSInteger)selectIndex
{
    [self.scrollView setContentOffset:CGPointMake(Kwidth*selectIndex, 0) animated:NO];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
     NSInteger currentPage = scrollView.contentOffset.x / self.view.frame.size.width;
    
    //    NSInteger start = currentPage == 0 ? currentPage : (currentPage + 1);
    //    NSInteger end = (currentPage == [self childViewControllerCount] - 1) ? currentPage : (currentPage);
    // 防止控制器切换的时候视频还在播放
    NSInteger start = currentPage == 0 ? currentPage : (currentPage );
    NSInteger end = (currentPage == [self childViewControllersNumber] - 1) ? currentPage : (currentPage);
    
    for (NSInteger index = start; index <= end; index++) {
        UIViewController *viewController = [self.displayVC objectForKey:@(index)];
        if (viewController == nil) {
            // 获取当前控制器
            [self getShowTheFonrt:index];
        }
    }
    //移除前面控制器
    for(NSInteger index = 0;index<=start-1;index++){
        UIViewController *viewController = [self.displayVC objectForKey:@(index)];
        [self removeChildViewControllers:viewController AtIndex:index];
    }
    //移除后面控制器
    for(NSInteger index = end+1 ;index<=[self childViewControllersNumber] - 1;index++){
        UIViewController *viewController = [self.displayVC objectForKey:@(index)];
        [self removeChildViewControllers:viewController AtIndex:index];
    }
    
    if ([_delegate respondsToSelector:@selector(customSliderDidScroll:andSegmentPage:)]) {
        [_delegate customSliderDidScroll:scrollView andSegmentPage:currentPage];
    }
    
}


-(NSInteger)childViewControllersNumber
{
    if ([_delegate respondsToSelector:@selector(numberOfChildVCInCustomSliderVC)]) {
        return [_delegate numberOfChildVCInCustomSliderVC];
    }else{
        return Kwidth;
    }
}

//添加子控制器
- (void)addChildViewControllers:(UIViewController *)viewController AtIndex:(NSInteger)index
{
    if ([self.childViewControllers containsObject:viewController]) {
        return ;
    }
    
    [self addChildViewController:viewController];
    [viewController willMoveToParentViewController:self];
    [self.scrollView addSubview:viewController.view];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.view.frame = CGRectMake(Kwidth*index, 0, Kwidth, self.scrollView.frame.size.height);
    [self.displayVC setObject:viewController forKey:@(index)];

    
}
//将子控制器放入缓存中
- (void)removeChildViewControllers:(UIViewController *)viewController AtIndex:(NSInteger)index
{
    if (viewController==nil) {
        return;
    }
    
    [viewController.view removeFromSuperview];
    [viewController willMoveToParentViewController:nil];
    [viewController removeFromParentViewController];
    [self.displayVC removeObjectForKey:@(index)];
    [self.memoryCache setObject:viewController forKey:@(index)];
}

- (void)getShowTheFonrt:(NSInteger)index
{
    UIViewController *viewController = [self.memoryCache objectForKey:@(index)];
    if (viewController==nil) {
        UIViewController *viewController = self.childViewControllersArray[index];
        [self addChildViewControllers:viewController AtIndex:index];
    }else{
        [self addChildViewControllers:viewController AtIndex:index];
    }
}

@end
