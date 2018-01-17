//
//  KSYHttpTool.h
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/27.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id responseObject);

typedef void(^Failure)(NSError* error);

@interface KSYHttpTool : NSObject

/**
 post请求

 @param URLString url
 @param parameters 请求参数
 @param success 成功的回调
 @param failure  失败的回调
 */

+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;

+ (void)GET:(NSString *)URLString
parameters:(id)parameters
success:(void (^)(id responseObject))success
failure:(void (^)(NSError *error))failure;

@end
