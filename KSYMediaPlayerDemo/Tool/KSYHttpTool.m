//
//  KSYHttpTool.m
//  KSYMediaPlayerDemo
//
//  Created by 王旭 on 2017/12/27.
//  Copyright © 2017年 王旭. All rights reserved.
//

#import "KSYHttpTool.h"

@implementation KSYHttpTool

+ (void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
   
    [session.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    // [self setHTTPHeader];  // 可在此处设置Http头信息
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [session POST:[NSString stringWithFormat:@"%@",URLString] parameters:parameters progress: ^(NSProgress *progress)
     {
         
     }
          success:^(NSURLSessionDataTask *task, id responseObject)
     {
         if (success) {
             
             success(responseObject);
             
         }
     }
          failure:^(NSURLSessionDataTask *task, NSError *error) {
              if (failure) {
                  failure(error);
              }
          }];
}

+ (void)GET:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    session.requestSerializer = [AFJSONRequestSerializer serializer];
    
    session.responseSerializer = [AFHTTPResponseSerializer serializer];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",nil];
    // [self setHTTPHeader];  // 可在此处设置Http头信息
    session.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [session GET:[NSString stringWithFormat:@"%@",URLString] parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        
    }];
   
}


@end
