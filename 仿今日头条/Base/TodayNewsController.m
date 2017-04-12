//
//  TodayNewsController.m
//  仿今日头条
//
//  Created by 黄feilong on 17/4/10.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "TodayNewsController.h"
#import "TodayNavViewController.h"

#define kClassKey   @"rootVCClassString"
#define kTitleKey   @"title"
#define kImgKey     @"imageName"
#define kSelImgKey  @"selectedImageName"

@interface TodayNewsController ()

@end

@implementation TodayNewsController

+ (void)initialize
{
    [UITabBar appearance].barTintColor = rgba(242,242,242,1.0);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *childItemsArray = @[
                                 @{kClassKey  : @"HomeTableViewController",
                                   kTitleKey  : @"首页",
                                   kImgKey    : @"home_tabbar_22x22_",
                                   kSelImgKey : @"home_tabbar_press_22x22_"},
                                 
                                 @{kClassKey  : @"VideoTableViewController",
                                   kTitleKey  : @"视频",
                                   kImgKey    : @"video_tabbar_22x22_",
                                   kSelImgKey : @"video_tabbar_press_22x22_"},
                                 
                                 @{kClassKey  : @"FoxTableViewController",
                                   kTitleKey  : @"关注",
                                   kImgKey    : @"newcare_tabbar_22x22_",
                                   kSelImgKey : @"newcare_tabbar_press_22x22_"},
                                 
                                 @{kClassKey  : @"MineViewController",
                                   kTitleKey  : @"我的",
                                   kImgKey    : @"mine_tabbar_22x22_",
                                   kSelImgKey : @"mine_tabbar_press_22x22_"} ];
    
    [childItemsArray enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UIViewController *vc = [NSClassFromString(dict[kClassKey]) new];
        vc.title = dict[kTitleKey];
        TodayNavViewController *nav = [[TodayNavViewController alloc] initWithRootViewController:vc];
        UITabBarItem *item = nav.tabBarItem;
        item.title = dict[kTitleKey];
        item.image = [UIImage imageNamed:dict[kImgKey]];
        item.selectedImage = [[UIImage imageNamed:dict[kSelImgKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [item setTitleTextAttributes:@{NSForegroundColorAttributeName : RedColor} forState:UIControlStateSelected];
        [self addChildViewController:nav];
        
    }];
    
    
    [[TodayTool shareTool] toolGet:homeApi paramskey:nil success:^(id responceObject, BOOL success, NSString *message) {
        
    } Fail:^(NSString *message, NSInteger code) {
        
    }];
    
    
}

@end
