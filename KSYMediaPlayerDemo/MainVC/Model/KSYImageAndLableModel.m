//
//  KSYImageAndLableModel.m
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/26.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import "KSYImageAndLableModel.h"

@implementation KSYImageAndLableModel

- (KSYImageAndLableModel*)initWithDictionary:(NSDictionary *)dic {
    if (self = [super init]) {
        
        NSArray *coverArray = [dic valueForKey:@"CoverURL"];
        self.iconUrl = coverArray[0];
        
        NSArray *playArray = [dic valueForKey:@"PlayURL"];
        self.videoPlayUrl = playArray[0];
        
        self.videoTitle = [dic valueForKey:@"VideoTitle"];
        self.videoID = [[dic valueForKey:@"VideoID"] integerValue];
        
       // self.
        //[self setValuesForKeysWithDictionary:dic];
        
    }
    return self;
}

+ (KSYImageAndLableModel*)modelWithDictionary:(NSDictionary *)dic {
    KSYImageAndLableModel* model = [[KSYImageAndLableModel alloc]initWithDictionary:dic];
    return model;
}

@end
