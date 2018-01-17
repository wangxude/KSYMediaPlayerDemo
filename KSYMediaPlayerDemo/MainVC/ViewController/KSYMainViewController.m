//
//  KSYMainViewController.m
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/22.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import "KSYMainViewController.h"

#import "KSYPlayerViewController.h"

@interface KSYMainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView* mainTableView;

//数组名字
@property(nonatomic,strong)NSArray* titleArray;

@end

@implementation KSYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // self.view.backgroundColor = [UIColor redColor];
    
    self.mainTableView = [[UITableView alloc]initWithFrame: CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    [self.view addSubview:self.mainTableView];
    
//    self.mainTableView.adjustedContentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    //被废弃了
    //automaticallyAdjustsScrollViewInsets
//    self.mainTableView.automaticallyAdjustsScrollViewInsets = YES;
    

    // Do any additional setup after loading the view.
}

#pragma mark - dataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* cellIdentifier = @"cell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"测试";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@",@"测试");
    KSYPlayerViewController* playerVC = [[KSYPlayerViewController alloc]init];
    [self.navigationController pushViewController:playerVC animated:YES];
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
