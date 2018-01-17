//
//  KSYImageAndLabelCollectionViewCell.m
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/26.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import "KSYImageAndLabelCollectionViewCell.h"

@interface KSYImageAndLabelCollectionViewCell()
//图片
@property(nonatomic,strong)UIImageView* iconImageView;
//标题
@property(nonatomic,strong)UILabel* titleLabel;

@end

@implementation KSYImageAndLabelCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubViewControl];
    }
    return self;
}


-(void)setModel:(KSYImageAndLableModel *)model{
  
    
    NSURL* url = [NSURL URLWithString:model.iconUrl];
    
    [self.iconImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"2a56ea3e36eeb45ac1cfb2e79ac6dc20.jpg"]];
    

    self.titleLabel.text = [NSString stringWithFormat:@"%@",model.videoTitle];
    self.titleLabel.textColor = [UIColor redColor];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    
}

-(void)addSubViewControl{
    
   
    self.iconImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:self.iconImageView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.height.equalTo(self.contentView).multipliedBy(0.8);
    }];
    
    self.titleLabel = [[UILabel alloc]init];
    [self.contentView addSubview: self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.top.equalTo(self.iconImageView.mas_bottom);
        make.width.equalTo(self.contentView);
        make.height.equalTo(self.contentView).multipliedBy(0.2);
    }];
}


//-(void)layoutSubviews{
//    [self addSubViewControl];
//}


@end
