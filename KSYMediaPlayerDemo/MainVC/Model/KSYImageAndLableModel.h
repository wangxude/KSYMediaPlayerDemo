//
//  KSYImageAndLableModel.h
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/26.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KSYImageAndLableModel : NSObject

//图片名字
@property(nonatomic,copy)NSString* iconUrl;
//播放视频的url
@property(nonatomic,copy)NSString* videoPlayUrl;
//videoID
@property(nonatomic,assign)NSInteger videoID;
//视频的名字
@property(nonatomic,copy)NSString* videoTitle;

-(KSYImageAndLableModel*)initWithDictionary:(NSDictionary*)dic;

+(KSYImageAndLableModel*)modelWithDictionary:(NSDictionary*)dic;

@end
