//
//  KSYBaseViewController.m
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2018/1/5.
//  Copyright © 2018年 王旭. All rights reserved.
//

#import "KSYBaseViewController.h"
#import "AppDelegate.h"

@interface KSYBaseViewController ()

@end

@implementation KSYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate* delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    delegate.allowRotation = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
