//
//  LoginViewController.h
//  MaDongFrame
//
//  Created by 码动 on 16/10/8.
//  Copyright © 2016年 digirun. All rights reserved.
//

#import "AFHTTPSessionManager.h"

typedef void (^networkCompletionBlock)(id obj, NSError *error);

@interface NetworkClient : AFHTTPSessionManager




+ (instancetype)sharedClient;


//meng封装的网络请求方法
- (void)POST:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;
-(void)POST:(NSString *)URLString dataStr:(id)data succeed:(void (^)(id))succeed failure:(void (^)(NSError *))failure;
- (void)GET:(NSString *)URLString dict:(id)dict succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;

@end
