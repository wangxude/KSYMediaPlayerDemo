//
//  KSYVodPlayOperationView.h
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2018/1/8.
//  Copyright © 2018年 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"

@interface KSYVodPlayOperationView : UIView

@property (nonatomic,assign) BOOL fullScreen;

@property (nonatomic,copy) void(^playStateBlock)(VCPlayHandlerState);
@property (nonatomic,copy) void(^dragSliderBlock)(float progress);
@property (nonatomic,copy) void(^nextButtonBlock)(void);
@property (nonatomic,copy) void(^definitionChoiceBlock)(void);

@end
