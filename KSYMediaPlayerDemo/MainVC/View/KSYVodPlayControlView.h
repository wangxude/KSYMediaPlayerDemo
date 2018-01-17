//
//  KSYVodPlayControlView.h
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2018/1/5.
//  Copyright © 2018年 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSYVodPlayControlView : UIView

@property (nonatomic,strong) UIButton* pauseButton;
@property (nonatomic,strong) UIButton* fullScreenButton;
@property (nonatomic,strong) UILabel* playTimeLabel;
@property (nonatomic,strong) UILabel* totalPlayTimeLabel;
@property (nonatomic,strong) UISlider* playSlider;
@property (nonatomic,strong) UIButton* nextButton;
@property (nonatomic,strong) UIButton* switchClarityButton;

- (void)screenRotateHandle:(BOOL)fullScreen;

@end
