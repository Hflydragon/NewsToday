//
//  HDZCustomMenusScroll.m
//  内涵段子demo
//
//  Created by 黄feilong on 16/10/24.
//  Copyright © 2016年 feilong. All rights reserved.
//  上面滑动的菜单

#import "HDZCustomMenusScroll.h"
#define Kwidth [UIScreen mainScreen].bounds.size.width

#define Keight [UIScreen mainScreen].bounds.size.height

@interface HDZCustomMenusScrollItem : UILabel
@property (nonatomic,assign)BOOL selected;
@end

@implementation HDZCustomMenusScrollItem

-(instancetype)init{
    
    if (self = [super init]){
        self.textColor = [UIColor colorWithRed:0.12 green:0.12 blue:0.12 alpha:1.0];
        self.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}

-(void)setSelected:(BOOL)selected
{
    _selected = selected;
    if(_selected){
        self.textColor = [UIColor colorWithRed:248/255.0 green:89/255.0 blue:89/255.0 alpha:1.0];
    }else{
        self.textColor = [UIColor colorWithRed:0.12 green:0.12 blue:0.12 alpha:1.0];
    }
}

@end


@implementation HDZCustomMenusScroll{
    NSArray *_titleArray;
    HDZCustomMenusScrollItem *_selectedItem;
    HDZCustomMenusScrollItem *_lastItem;
}

-(void)setUpTitleArrays:(NSArray *)array
{
    _titleArray = array.copy;
    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;
    self.backgroundColor = [UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1.0];
    
    if(_titleArray.count>0){
        
        for(int i=0;i<_titleArray.count;i++){
            
            HDZCustomMenusScrollItem *item = [[HDZCustomMenusScrollItem alloc] init];
            item.text = _titleArray[i];
            item.font = kFont(16);
            CGFloat widthNew = [item.text widthForFont:item.font]+20;
            item.frame = CGRectMake(_lastItem.right, 0, widthNew, self.height);
            item.userInteractionEnabled = YES;
            [item addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectedItems:)]];
            item.tag = i+10;
            [self addSubview:item];
            if (i==0) {
                _selectedItem = item;
                _selectedItem.selected = YES;
            }
            _lastItem = item;
        }
    }
    self.contentSize = CGSizeMake(_lastItem.right, -self.height);
    
}

-(void)setSelectedindex:(NSInteger)selectedindex
{
    _selectedindex = selectedindex;
    for (HDZCustomMenusScrollItem *item in self.subviews) {
        if (item.tag==_selectedindex+10) {
            [self selectedDoSomething:item];
        }
    }
}

-(void)clickDefault
{
    if(self.menuScrollerDidSelectItem){
        self.menuScrollerDidSelectItem(self,_titleArray[0],0);
    }

}

- (void)selectedItems:(UITapGestureRecognizer *)sender
{
    HDZCustomMenusScrollItem *label = (HDZCustomMenusScrollItem *)sender.view;
    [self selectedDoSomething:label];
    if(self.menuScrollerDidSelectItem){
        self.menuScrollerDidSelectItem(self,label.text,label.tag-10);
    }
}

-(void)selectedDoSomething:(HDZCustomMenusScrollItem *)label
{
    _selectedItem.selected = NO;
    label.selected = YES;
    _selectedItem = label;
    
    if(label.center.x>Kwidth/2){
        
        if (label.center.x<self.contentSize.width-Kwidth/2) {
            
            [self setContentOffset:CGPointMake((label.center.x-Kwidth/2), 0) animated:YES];
        }else{
            
            [self setContentOffset:CGPointMake((self.contentSize.width-Kwidth), 0) animated:YES];
        }
        
    }else{
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
    }
}


@end
