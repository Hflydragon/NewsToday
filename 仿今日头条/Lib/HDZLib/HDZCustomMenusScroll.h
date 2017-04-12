//
//  HDZCustomMenusScroll.h
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/24.
//  Copyright © 2016年 feilong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDZCustomMenusScroll : UIScrollView

@property (nonatomic,copy)void (^menuScrollerDidSelectItem)(HDZCustomMenusScroll *menu,NSString *title,NSUInteger index);

@property (nonatomic,assign)NSInteger selectedindex;


-(void)clickDefault;

-(void)setUpTitleArrays:(NSArray *)array;

@end
