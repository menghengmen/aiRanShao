//
//  NetworkClient.m
//  MiaoZhu
//
//  Created by 码动 on 16/6/30.
//  Copyright © 2016年 码动. All rights reserved.
//

#import "NetworkClient.h"

@implementation NetworkClient

+ (instancetype)sharedClient{
    static NetworkClient *sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *cofig=[NSURLSessionConfiguration defaultSessionConfiguration];
        // [cofig setHTTPAdditionalHeaders:nil];
        NSURLCache *cache=[[NSURLCache alloc]initWithMemoryCapacity:10 * 1024 * 1024
                                                       diskCapacity:50 * 1024 * 1024
                                                           diskPath:nil];
        [cofig setURLCache:cache];
        sharedClient = [[NetworkClient alloc] initWithBaseURL:[NSURL URLWithString:BASE_API_URL]sessionConfiguration:cofig];
        sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return sharedClient;
}


/**************meng封装的网络请求方法******************************************/
-(void)POST:(NSString *)URLString dict:(id)dict succeed:(void (^)(id))succeed failure:(void (^)(NSError *))failure{
    
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    // manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/html", nil];
    

    [manager.requestSerializer setValue:@"kqmsVsuHMg2dF+Y/9WhBCsR18on+CgsI7XK59V6RvOrgxOwcRTt4uQ==" forHTTPHeaderField:@"token"];
    [manager.requestSerializer setValue:@"__cfduid=dbd170d189d9953b0ecca89a83b149a5c1536765851" forHTTPHeaderField:@"cookie"];
    [manager.requestSerializer setValue:@"593fac40d3a2c837febc1eefbde309a1" forHTTPHeaderField:@"devideNo"];
    NSString *jsonStr = [self convertToJsonData:dict];

    //发送网络请求(请求方式为POST)
    [manager POST:URLString parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

-(void)POST:(NSString *)URLString dataStr:(id)data succeed:(void (^)(id))succeed failure:(void (^)(NSError *))failure{
    
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
   
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json",@"text/html", nil];
    [manager.requestSerializer setValue:@"kqmsVsuHMg2dF+Y/9WhBCsR18on+CgsI7XK59V6RvOrgxOwcRTt4uQ==" forHTTPHeaderField:@"token"];
    [manager.requestSerializer setValue:@"__cfduid=dbd170d189d9953b0ecca89a83b149a5c1536765851" forHTTPHeaderField:@"cookie"];
    [manager.requestSerializer setValue:@"593fac40d3a2c837febc1eefbde309a1" forHTTPHeaderField:@"devideNo"];
    
    //发送网络请求(请求方式为POST)
    [manager POST:URLString parameters:data progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}

-(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}





-(void)GET:(NSString *)URLString dict:(id)dict succeed:(void (^)(id))succeed failure:(void (^)(NSError *))failure{
    
    //创建网络请求管理对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain",@"image/png",@"text/javascript",nil];
    [manager.requestSerializer setValue:@"047ca3be87d3cd91c6fcfa30f40669f9d74b8594d6692d07528d6f8a39dd1c1d26" forHTTPHeaderField:@"Authorization"];
    
    [manager.requestSerializer setValue:@"45B6EF06-106E-4936-ABDD-DB69361ED12A1535027865" forHTTPHeaderField:@"flowId"];
    [manager.requestSerializer setValue:@"ac40d3a2c837febceefb1C30mC34pCJ0uCpK" forHTTPHeaderField:@"seq"];
    [manager.requestSerializer setValue:@"110002101" forHTTPHeaderField:@"Version"];
    //发送网络请求(请求方式为GET)
    [manager GET:URLString parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succeed(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
    
    
}

@end
