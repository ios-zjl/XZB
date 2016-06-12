//
//  HttpTool.m
//  YiHaoZhuShou
//
//  Created by 张金龙 on 16/3/25.
//  Copyright © 2016年 YHZS. All rights reserved.
//

#import "HttpTool.h"
#import <AFNetworking.h>
#import "AppDelegate.h"
#import "AFHTTPRequestOperationManager.h"

@implementation HttpTool

+(void)GET:(NSString *)url params:(NSDictionary *)params success:(RequestSuccess)success failure:(RequestFailure)failure{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer.timeoutInterval = kHTTP_TIMEOUT_INTERVAL;
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 1.0f;//kHTTP_TIMEOUT_INTERVAL;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //设置响应内容格式  经常因为服务器返回的格式不是标准json而出错 服务器可能返回text/html text/plain 作为jso
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"server respones: 【ur=%@】 = %@",url,operation.responseString);
        !success?:success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        !failure?:failure(error);
    }];
    
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
    }];
}

+(void)POST:(NSString *)url params:(NSDictionary *)params success:(RequestSuccess)success failure:(RequestFailure)failure{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer.timeoutInterval = kHTTP_TIMEOUT_INTERVAL;
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //设置响应内容格式  经常因为服务器返回的格式不是标准json而出错 服务器可能返回text/html text/plain 作为jso
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"server respones: 【ur=%@】 = %@",url,operation.responseString);
        !success?:success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        !failure?:failure(error);
    }];
}
// 一号助手 请求
+(void)RequestDataYHZS:(NSString *)url params:(NSDictionary *)params success:(RequestSuccess)success failure:(RequestFailure)failure{
 
//    NSMutableDictionary *pms=[NSMutableDictionary dictionaryWithDictionary:params];
//     [pms setValue:@"1" forKey:@"pushAddr"];
    
    if ([GlobalHelper CurrentHasNetWork]) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = 3.0f;//kHTTP_TIMEOUT_INTERVAL;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
        // 设置请求格式
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        //设置响应内容格式  经常因为服务器返回的格式不是标准json而出错 服务器可能返回text/html text/plain 作为json
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain",nil];
        [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSDictionary *dict = responseObject;
            
            if ([[dict objectForKey:@"code"] isEqualToString:@"000000"]) {
                MLog(@"请求成功 结果： %@ =%@=",url,operation.responseString);
                success(responseObject);
            }else if([[dict objectForKey:@"code"] isEqualToString:@"000002"]){
                MLog(@"token失效： %@ =%@=",url,operation.responseString);
                // 回到登录页
//                [[AppDelegate shareDelegate] setRootLoginViewController];
                [SVProgressHUD showErrorWithStatus:[dict objectForKey:@"msg"]];
            }else{
                MLog(@"请求失败 结果： %@ =%@=",url,operation.responseString);
                failure([dict objectForKey:@"msg"]);
            }
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            MLog(@"出错：[url:%@]    %@ ， error:%@ , error 【%@】",url,operation.responseString,[error description],error);
            !failure?:failure(error);
        }];
    }else{
        [SVProgressHUD showWithStr:@"无网络状态"];
        failure(nil);
    }
    
    
}

@end
