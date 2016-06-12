//
//  HttpTool.h
//  YiHaoZhuShou
//
//  Created by 张金龙 on 16/3/25.
//  Copyright © 2016年 YHZS. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RequestSuccess)(id json);
typedef void(^RequestFailure)(NSError *error);


@interface HttpTool : NSObject


+(void)GET:(NSString *)url params:(NSDictionary *)params success:(RequestSuccess)success failure:(RequestFailure)failure;
+(void)POST:(NSString *)url params:(NSDictionary *)params success:(RequestSuccess)success failure:(RequestFailure)failure;
// 一号助手接口请求
+(void)RequestDataYHZS:(NSString *)url params:(NSDictionary *)params success:(RequestSuccess)success failure:(RequestFailure)failure;

@end
