//
//  UIButton+KSYAdditions.h
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2018/1/5.
//  Copyright © 2018年 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (KSYAdditions)

- (instancetype)initButtonWithTitle:(NSString*)title titleColor:(UIColor*)color fontSize:(CGFloat)fontSize backGroundColor:(UIColor*)backGroundColor imageName:(NSString*)imageName target:(id)target action:(SEL)action;

@end
