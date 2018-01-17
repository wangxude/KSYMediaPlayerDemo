//
//  AppDelegate.h
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/22.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KSYSettingModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//允许切换横竖屏
@property(nonatomic,assign)BOOL allowRotation;
//配置界面
@property(nonatomic,strong)KSYSettingModel *settingModel;



@end

