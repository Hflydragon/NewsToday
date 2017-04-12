//
//  HomeTableViewController.m
//  仿今日头条
//
//  Created by 黄feilong on 17/4/10.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "HomeTableViewController.h"
#import "HeadView.h"
#import "PYSearch.h"
#import "HDZManager.h"
#import "APIModel.h"
#import "HomeDetailViewController.h"

@interface HomeTableViewController () <HDZCustomSliderVCDelegate>
@property (nonatomic,strong)HDZCustomMenusScroll *menu;

@property (nonatomic,strong)NSArray *titleArray;

@property (nonatomic,strong)NSArray *APIArray;

@property (nonatomic,strong)HDZCustomSliderVC *customSliderVC;

@property (weak,nonatomic)HeadView *headView;
@end

@implementation HomeTableViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //头部导航
    [self setHead];
    
    //头部滑动条
    [self setUpSliderAndVC];
    
}

/**
 头部导航
 */
- (void)setHead
{
    HeadView *head = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 64)];
    head.backgroundColor = RedColor;
    self.headView = head;
    [self.view addSubview:head];
    [head startOberser:^(HeadView *head) {
        //去搜索控制器
        [head toSearchController];
    } withController:self];
}

/**
 头部滑动条
 */
- (void)setUpSliderAndVC
{
    self.titleArray = [APIModel titleArray].copy;
    
    HDZCustomMenusScroll *menu = [[HDZCustomMenusScroll alloc] initWithFrame:CGRectMake(0, self.headView.bottom, self.view.width, 40)];
    [menu setUpTitleArrays:self.titleArray];
    [self.view addSubview:menu];
    self.menu = menu;
    WS(self)
    menu.menuScrollerDidSelectItem = ^(HDZCustomMenusScroll *menu,NSString *title,NSUInteger index){
        weakSelf.customSliderVC.selectIndex = index;
    };
    [menu clickDefault];
    [self.customSliderVC reloadData];
    
}

-(HDZCustomSliderVC *)customSliderVC
{
    if (_customSliderVC==nil) {
        _customSliderVC = [[HDZCustomSliderVC alloc] init];
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.titleArray.count];
        for(int i=0;i<self.titleArray.count;i++){
            HomeDetailViewController *home = [[HomeDetailViewController alloc] init];
            home.index = i;
            [array addObject:home];
        }
        _customSliderVC.childViewControllersArray = array;
        [_customSliderVC willMoveToParentViewController:self];
        _customSliderVC.view.frame = CGRectMake(0,self.menu.bottom, self.view.width, self.view.height - self.menu.bottom - 49);
        _customSliderVC.delegate = self;
        [self addChildViewController:_customSliderVC];
        [self.view addSubview:_customSliderVC.view];
    }
    return _customSliderVC;
}

#pragma mark HDZCustomSliderVCDelegate
-(NSInteger)numberOfChildVCInCustomSliderVC
{
    return self.titleArray.count;
}
- (void)customSliderDidScroll:(UIScrollView *)scroll andSegmentPage:(NSInteger)page
{
    if(page==self.menu.selectedindex) return;
    self.menu.selectedindex  = page;
}

- (NSString *)firstControllerData
{
    return nil;
}

@end
