//
//  KSYWaterFallLayout.h
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/26.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KSYWaterFallLayout;

@protocol  KSYWaterFallLayoutDelegate <NSObject>

//计算item的高度，传给外界
-(CGFloat)waterFallLayout:(KSYWaterFallLayout*)waterFallLayout itemHeightWithItemWidth:(CGFloat)itemWidth atIndexPath:(NSIndexPath*)indexPath;

@end

@interface KSYWaterFallLayout : UICollectionViewLayout

/**
  列数、默认值为3
 */
@property(nonatomic,assign) NSInteger columnNumber;

/**
 列间距
 */
@property(nonatomic,assign)CGFloat columnSpacing;

/**
 行间距
 */
@property(nonatomic,assign) CGFloat rowSpacing;

/**
 每个section与collectionView的间距
 */
@property(nonatomic,assign)UIEdgeInsets sectionEdgeInsets;

@property(nonatomic,weak)id<KSYWaterFallLayoutDelegate> delegate;

+(instancetype)waterFallLayoutWithColumnCount:(NSInteger)columnCount;

-(instancetype)initWithColumnCount:(NSInteger)coulumCount;

- (void)setColumnSpacing:(NSInteger)columnSpacing rowSpacing:(NSInteger)rowSepacing sectionInset:(UIEdgeInsets)sectionInset;

@end
