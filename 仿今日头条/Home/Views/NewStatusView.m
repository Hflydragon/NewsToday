//
//  NewStatusView.m
//  仿今日头条
//
//  Created by 黄feilong on 17/4/12.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "NewStatusView.h"

@class NewStatusView;
@implementation NewStatusView{
    
    UILabel *_labelV;
}

- (instancetype)init
{
    if(self = [super init]){
        UILabel *labelV = [[UILabel alloc] init];
        labelV.textAlignment = NSTextAlignmentCenter;
        labelV.textColor = rgba(70, 120, 31, 1.0);
        _labelV = labelV;
        [self addSubview:labelV];
        
        self.backgroundColor = rgba(80, 200, 50, 1.0);
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _labelV.frame = self.bounds;
}

+ (instancetype)showNews:(NSString *)num
{
    NewStatusView *new = [[NewStatusView alloc] init];
    new->_labelV.text = [NSString stringWithFormat:@"为您更新%@条资讯，请您慢用",num];
    [new startAnimation];
    return new;
}

- (void)startAnimation{
    
    dispatch_queue_t quene = dispatch_queue_create("animationQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(quene, ^{
        
        POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBounds];
        
        NSInteger height = 30;
        NSInteger width = kwidth;
        
        anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, width, height)];
        anim.springBounciness = 16;
        anim.springSpeed = 10;
        [self pop_addAnimation:anim forKey:@"size"];
        
        double delay = 2;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), quene, ^{
            // 2秒后需要执行的任务
            
            POPBasicAnimation *animB = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
            CGPoint center = self.center;
            animB.toValue = [NSValue valueWithCGPoint:CGPointMake(center.x, center.y - 40)];
            animB.duration = 1.f;
            [self pop_addAnimation:animB forKey:@"center"];
            
            [animB setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
               dispatch_async(dispatch_get_main_queue(), ^{
                   [self removeFromSuperview];
               });
            }];
        });
    });
    
    
    
    
}


@end
