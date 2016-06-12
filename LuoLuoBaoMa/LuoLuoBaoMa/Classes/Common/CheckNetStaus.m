//
//  CheckNetStaus.m
//  YiHaoZhuShou
//
//  Created by 张金龙 on 16/3/25.
//  Copyright © 2016年 YHZS. All rights reserved.
//

#import "CheckNetStaus.h"

@implementation CheckNetStaus


/**
 *  获取当前网络状态
 */
+(NetworkStatus)status{
    return [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
}



/**
 *  是否处于WIFI环境中：
 */
+(BOOL)isWIFIEnable{
    return [self status]==ReachableViaWiFi;
}



/**
 *  是否有网络数据连接：含2G/3G/WIFI
 */
+(BOOL)isNETWORKEnable{
    return [self status] != NotReachable;
}




@end
