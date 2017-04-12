//
//  HomeTableViewCell.m
//  仿今日头条
//
//  Created by 黄feilong on 17/4/11.
//  Copyright © 2017年 feilong. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeCellModel.h"

@interface HomeTableViewCell ()
@property (weak, nonatomic) IBOutlet YYAnimatedImageView *homeCellImage;
@property (weak, nonatomic) IBOutlet UILabel *titleV;

@property (weak, nonatomic) IBOutlet UILabel *dateV;


@end

@implementation HomeTableViewCell


+(instancetype)cell {
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.homeCellImage.contentMode = UIViewContentModeScaleAspectFill;
    self.homeCellImage.clipsToBounds = YES;
    self.homeCellImage.layer.shouldRasterize = YES;
    
    self.titleV.font = kFont(16);
    self.homeCellImage.width = self.homeCellImage.height+40;

}

-(void)setModel:(HomeCellModel *)model
{
    _model = model;

    [self.homeCellImage setImageWithURL:[NSURL URLWithString:_model.picUrl]  placeholder:nil options:YYWebImageOptionShowNetworkActivity|YYWebImageOptionUseNSURLCache completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
//      
    }];
    
    self.titleV.text = _model.title;
    
    self.dateV.text = _model.ctime;
    
    if(self.titleV.bottom>=self.dateV.top){
        self.titleV.height = self.dateV.top - self.titleV.top - 20;
        self.titleV.lineBreakMode = NSLineBreakByTruncatingTail;
    }
}

@end
