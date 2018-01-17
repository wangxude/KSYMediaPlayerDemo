//
//  KSYMainCollectionVC.h
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/26.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSYMainCollectionVC : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

/**
 瀑布流布局
 */
@property(nonatomic,strong)UICollectionView* waterFallCollectionView;

/**
 图片数组
 */
@property(nonatomic,strong)NSMutableArray* imageArray;



@end
