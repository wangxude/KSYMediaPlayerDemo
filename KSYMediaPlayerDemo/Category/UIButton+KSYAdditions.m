//
//  UIButton+KSYAdditions.m
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2018/1/5.
//  Copyright © 2018年 王旭. All rights reserved.
//

#import "UIButton+KSYAdditions.h"

@implementation UIButton (KSYAdditions)

- (instancetype)initButtonWithTitle:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)fontSize backGroundColor:(UIColor *)backGroundColor imageName:(NSString *)imageName target:(id)target action:(SEL)action {
    if (self = [super init]) {
        if (title != nil) {
            [self setTitle:title forState: UIControlStateNormal];
        }
        if (color != nil) {
             [self setTitleColor:color forState:UIControlStateNormal];
        }
        if (fontSize != 0) {
             self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        }
        if (backGroundColor != nil) {
           [self setBackgroundColor:backGroundColor];
        }
        if (imageName != nil) {
          [self setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        }
        [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

@end
