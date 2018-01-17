//
//  KSYSelectTypeViewController.m
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2018/1/9.
//  Copyright © 2018年 王旭. All rights reserved.
//

#import "KSYSelectTypeViewController.h"

@interface KSYSelectTypeViewController ()

@end

@implementation KSYSelectTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* beginShortVideo = [[UIButton alloc]init];
    beginShortVideo.frame = CGRectMake(100, 100, 100, 100);
    [beginShortVideo setTitle:@"开始短视频" forState:UIControlStateNormal];
    [self.view addSubview:beginShortVideo];
    // Do any additional setup after loading the view.
}

- (void)beginShortVideo {
    
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
