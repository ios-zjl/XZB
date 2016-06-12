//
//  MMLocationManager
//  xingzhengbao
//
//  Created by specter on 16/3/30.
//  Copyright © 2016年 XZB. All rights reserved.
//  系统定位

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^LocationBool)(BOOL value);

@interface CCLocationManager : NSObject<CLLocationManagerDelegate>
@property (nonatomic) CLLocationCoordinate2D lastCoordinate;
@property(nonatomic,strong)NSString *lastCity;
@property (nonatomic,strong) NSString *lastAddress;

@property(nonatomic,assign)float latitude;
@property(nonatomic,assign)float longitude;

@property (nonatomic , copy) LocationBool blockBool;

+ (CCLocationManager *)shareLocation;


/**
 *  计算手机所在经纬度,与策略下发的经纬度之间的距离,是否超过半径
 *
 *  @param longitude 经度
 *  @param latitude  纬度
 *  @param radius    半径
 *
 *  @return 返回yes则在范围内, 返回no则超出范围
 */
-(BOOL)judgeY:(CGFloat )longitude X:(CGFloat )latitude radius:(CGFloat)radius;

/**
 *  开启定位服务,获取当前经纬度
 */
- (void)startLocation;


@end
