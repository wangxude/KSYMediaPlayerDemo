//
//  KSYMainCollectionVC.m
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/26.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import "KSYMainCollectionVC.h"

#import "KSYWaterFallLayout.h"

#import "KSYImageAndLabelCollectionViewCell.h"

#import "KSYImageAndLableModel.h"

#import "KSYHttpTool.h"

#import "KSYPlayerViewController.h"

#define CellId @"collectionCell"

@interface KSYMainCollectionVC ()<KSYWaterFallLayoutDelegate>

@property(nonatomic,strong)NSDictionary* dictionary;

@property(nonatomic,strong)NSMutableArray* dataArray;

@end

@implementation KSYMainCollectionVC

//-(NSDictionary*)dictionary{
//    if (!_dictionary) {
//        _dictionary = [[NSDictionary alloc]initWithObjectsAndKeys:@"2a56ea3e36eeb45ac1cfb2e79ac6dc20.jpg",@"iconName",@"测试图片",@"titleName",nil];
//    }
//    return _dictionary;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    //设置界面
    [self setUpCollectionView];
    
    //请求参数
    [self requestParameter];
    // Do any additional setup after loading the view.
}

-(void)requestParameter{

    NSInteger showType = 2;
    NSString *urlString = [NSString stringWithFormat:@"https://appdemo.download.ks-cdn.com:8682/api/GetLiveUrl/2017-01-01?Option=%zd", showType];
//    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:@"",@"",@"",@"",nil]
    
    self.dataArray = [[NSMutableArray alloc]init];
    [KSYHttpTool GET:urlString parameters:nil success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary* dic = [NSDictionary dictionaryWithDictionary:[responseObject valueForKey:@"Data"]];
        
        NSArray* detailArray = [[NSArray alloc]initWithArray: [dic valueForKey:@"Detail"]];
        
        for (int i = 0; i<detailArray.count; i++) {
            KSYImageAndLableModel* model = [KSYImageAndLableModel modelWithDictionary:detailArray[i]];
            [self.dataArray addObject:model];
            if (i == detailArray.count - 1) {
                [self.waterFallCollectionView reloadData];
            }
        }
//        [detailArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            KSYImageAndLableModel* model = [KSYImageAndLableModel modelWithDictionary:obj];
//            [self.dataArray addObject:model];
////            if (!stop) {
////            if (idx == self.dataArray.count - 1) {
////              [self.waterFallCollectionView reloadData];
////            }
//           // }
//        }];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(void)setUpCollectionView{
    
    KSYWaterFallLayout* layout = [[KSYWaterFallLayout alloc]initWithColumnCount:2];
    layout.delegate = self;
    [layout setColumnSpacing:5 rowSpacing:5 sectionInset:UIEdgeInsetsMake(10, 5, 10, 5)];
    
    self.waterFallCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64) collectionViewLayout:layout];
    self.waterFallCollectionView.backgroundColor = [UIColor whiteColor];
    [self.waterFallCollectionView registerClass:[KSYImageAndLabelCollectionViewCell class] forCellWithReuseIdentifier:CellId];
    self.waterFallCollectionView.delegate = self;
    self.waterFallCollectionView.dataSource = self;
    [self.view addSubview:self.waterFallCollectionView];
    self.waterFallCollectionView.backgroundColor = [UIColor blackColor];
//    self.waterFallCollectionView.addtionalSafeAreaInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //self.waterFallCollectionView.contentInset = ;
//    [self.waterFallCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        if (@available(iOS 11.0, *)) {
//            make.centerY.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(64);
//        } else {
//            make.centerY.mas_equalTo(self.view.mas_top).offset(20);
//        }
//        make.width.mas_equalTo(self.view.bounds.size.width);
//        make.height.equalTo(@300);
//    }];
    
    

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.dataArray.count == 0) {
        return 0;
    }
    NSLog(@"%ld",self.dataArray.count);
    return self.dataArray.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(__kindof UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    KSYImageAndLabelCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellId forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.item];
    return cell;
}

-(CGFloat)waterFallLayout:(KSYWaterFallLayout *)waterFallLayout itemHeightWithItemWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath *)indexPath{

    //根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
      return 120;
//    KSYImageAndLableModel *imageModel = self.dataArray[indexPath.item];
//    NSURL* url = [NSURL URLWithString:imageModel.iconUrl];
//    NSData* data = [NSData dataWithContentsOfURL:url];
//    UIImage* image = [UIImage imageWithData:data];
//    return image.size.height/image.size.width * itemWidth + 35;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    KSYImageAndLableModel *model = self.dataArray[indexPath.item];
    NSURL *url = [NSURL URLWithString:model.videoPlayUrl];
    KSYPlayerViewController *playerVC = [[KSYPlayerViewController alloc]initWithUrlAndConfigure:url];
    playerVC.hidesBottomBarWhenPushed = YES;
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
