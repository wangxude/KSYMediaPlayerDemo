//
//  KSYVodPlayControlView.m
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2018/1/5.
//  Copyright © 2018年 王旭. All rights reserved.
//

#import "KSYVodPlayControlView.h"

@implementation KSYVodPlayControlView

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4/1.0];
        [self setUpChildView];
    }
    return self;
}

- (void)setUpChildView {
    
    self.playSlider.thumbTintColor = [UIColor colorWithHexString:@"FC3252"];
    self.playSlider.minimumTrackTintColor = [UIColor colorWithHexString:@"FC3252"];
    
    self.pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pauseButton setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
    [self.pauseButton setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateSelected];
    [self addSubview:self.pauseButton];
    
    self.playTimeLabel = [[UILabel alloc]init];
    self.playTimeLabel.text = @"00:00";
    self.playTimeLabel.textColor = [UIColor redColor];
    self.playTimeLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.playTimeLabel];
    
    self.playSlider = [[UISlider alloc]init];
    [self addSubview:self.playSlider];
    
    self.totalPlayTimeLabel = [[UILabel alloc]init];
    self.totalPlayTimeLabel.text = @"00:10";
    self.totalPlayTimeLabel.textColor = [UIColor redColor];
    self.totalPlayTimeLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.totalPlayTimeLabel];
    
    self.fullScreenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.fullScreenButton setImage:[UIImage imageNamed:@"switchTofullScreen"] forState:UIControlStateNormal];
    [self addSubview:self.fullScreenButton];
    
    [self fullScreenHandle];
}

- (void)screenRotateHandle:(BOOL)fullScreen {
    if (fullScreen) {
        [self fullScreenHandle];
    }
    else{
        [self portraitScreenHandle];
    }
}

- (void)fullScreenHandle {
    CGFloat margin = 5;
    CGFloat controlWidth = 40;
    CGFloat controlHeight = 40;
    
    [self.pauseButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.bottom.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(controlWidth, controlHeight));
    }];
    [self.playTimeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pauseButton.mas_right).offset(margin);
        make.bottom.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(60, controlHeight));
    }];
    [self.fullScreenButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-margin);
        make.bottom.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(controlWidth, controlHeight));
    }];
    [self.totalPlayTimeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.fullScreenButton.mas_left).offset(-margin);
        make.bottom.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(60, controlHeight));
    }];
    [self.playSlider mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.playTimeLabel.mas_right).offset(margin);
        make.right.equalTo(self.totalPlayTimeLabel.mas_left).offset(-margin);
        make.height.mas_equalTo(controlHeight);
        make.bottom.equalTo(self);
    }];
}

- (void)portraitScreenHandle {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
