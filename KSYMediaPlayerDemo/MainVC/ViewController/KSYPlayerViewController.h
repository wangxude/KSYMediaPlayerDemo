//
//  KSYPlayerViewController.h
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/25.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import "KSYBaseViewController.h"

@interface KSYPlayerViewController : KSYBaseViewController

- (instancetype)initWithUrlAndConfigure:(NSURL*)url;

@property(nonatomic,strong)KSYMoviePlayerController* ksyPlayer;

@end
