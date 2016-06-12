//
//  MMLocationManager
//  xingzhengbao
//
//  Created by specter on 16/3/30.
//  Copyright © 2016年 XZB. All rights reserved.
//  系统定位

#import "CCLocationManager.h"
#import <math.h>
@interface CCLocationManager (){
    CLLocationManager *_manager;
    double x;
    double y;
    double _radius;
}


@end

@implementation CCLocationManager


+ (CCLocationManager *)shareLocation{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}



/**
 * 计算地球上任意两点(经纬度)距离
 *
 * @param long1
 *            第一点经度
 * @param lat1
 *            第一点纬度
 * @param long2
 *            第二点经度
 * @param lat2
 *            第二点纬度
 * @return 返回距离 单位：米
 */
- (double)Distancelatitude1:(double) lat1  longitude2:(double)long1 latitude2:(double) lat2 longitude2:(double) long2
{
    double a, b, R;
    R = 6378137; // 地球半径
    lat1 = lat1 * M_PI / 180.0;
    lat2 = lat2 * M_PI / 180.0;
    a = lat1 - lat2;
    b = (long1 - long2) * M_PI / 180.0;
    double d;
    double sa2, sb2;
    sa2 = sin(a / 2.0);
    sb2 = sin(b / 2.0);
    d = 2
    * R
    * asin(sqrt(sa2 * sa2 + cos(lat1)
                * cos(lat2) * sb2 * sb2));
    return d;
}

- (double)jisuanX1:(double) lat1  Y1:(double)long1 X2:(double) lat2 Y2:(double) long2
{
    CLLocation *orig=[[CLLocation alloc] initWithLatitude:lat1 longitude:long1];
    CLLocation* dist=[[CLLocation alloc] initWithLatitude:lat2 longitude:long2];
    
    CLLocationDistance kilometers=[orig distanceFromLocation:dist];
    return kilometers;
}
#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    
//    _lastCoordinate = CLLocationCoordinate2DMake(newLocation.coordinate.latitude ,newLocation.coordinate.longitude );
//    NSMutableDictionary * dic = [[NSMutableDictionary alloc]initWithCapacity:0];
//    [dic setObject:[NSString stringWithFormat:@"%f",newLocation.coordinate.latitude] forKey:@"纬度"];
//    [dic setObject:[NSString stringWithFormat:@"%f",newLocation.coordinate.longitude] forKey:@"经度"];
    
    _latitude = newLocation.coordinate.latitude;
    _longitude = newLocation.coordinate.longitude;
    NSLog(@"系统定位 ---- 纬度:%f    经度:%f",newLocation.coordinate.latitude,newLocation.coordinate.longitude);

    [manager stopUpdatingLocation];
    
}


-(BOOL)judgeY:(CGFloat )longitude X:(CGFloat )latitude radius:(CGFloat)radius
{
    x = latitude;
    y = longitude;
    _radius = radius;
//    NSDictionary * dic =  [Public getUserDefault:@"经纬度"];
//    
//    ;
//    
//    double m = [self jisuanX1:[[dic objectForKey:@"纬度"] doubleValue] Y1:[[dic objectForKey:@"经度"] doubleValue] X2:x Y2:y];
//    NSLog(@"******* %f",[self jisuanX1:[[dic objectForKey:@"纬度"] doubleValue] Y1:[[dic objectForKey:@"经度"] doubleValue] X2:x Y2:y]);
//    if (m < _radius) {
//        return YES;
//    }
//    else
//    {
//        return NO;
//    }
    return NO;
}

- (void)startLocation
{
    if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied)
    {
        if (_manager == nil)
        {
            _manager = [[CLLocationManager alloc]init];
        }
        _manager.delegate = self;
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
        if (iOS8) {
            [_manager requestAlwaysAuthorization];
        }
        _manager.distanceFilter = 10;
        [_manager startUpdatingLocation];
        _manager.pausesLocationUpdatesAutomatically = NO;
    }
    else
    {
        UIAlertView *alvertView=[[UIAlertView alloc]initWithTitle:@"提示" message:@"需要开启定位服务,请到设置->隐私,打开定位服务" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alvertView show];
        
    }
}
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    [self stopLocation];
    
}
-(void)stopLocation
{
    _manager = nil;
    
}


@end
