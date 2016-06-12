//
//  GlobalHelper.h
//  erge
//
//  Created by dou7 on 14-8-4.
//  Copyright (c) 2014年 dou7. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"


@interface GlobalHelper : NSObject

//十六进制  转成 rgb 颜色值
+( UIColor *) getColor:( NSString *)hexColor;
+(NSString*) getDeviceID;
+(NSString*) getTimeString:(float) time;
+(NSString *)replaceHTML:(NSString *)html;
+(NSString *) UnicodeHexValue:(NSString *)content;

+(NSString*)getSize :(float)size;
+(void) deleteAllSetting;// 删除数据  1028
//zjl  时间转换
+ (NSString *)getStringDate:(NSDate *)newdate;
+ (NSDate *)getDateByString:(NSString *)timeStr;
+ (NSDate *)getDateByDataString:(NSString *)timeStr;
+ (NSString *)getStringforDate:(NSString *)timeStamp;
//
+(BOOL) compareCurrentTime:(NSDate*) compareDate;
+(void)deleteFiles:(NSString *)path withExtentionName:(NSString *)extName;
+ (NSString *)getDocumentRoot;
+ (int)convertToInt:(NSString*)strtemp;
//当前网络状态
+ (BOOL)CurrentHasNetWork;
// 获取一个guid字符串
+(NSString *)getGuidString;
//根据时间段   获得时间字符串
+(NSString *)GetDateStringByTimeSpan:(NSString *)timeSpan andStyle:(NSString *)style;
// udf  定/取
+(NSString *)getValueByUserDefault:(NSString *)key;
+(void)setValueByUserDefault:(NSString *)value key:(NSString *)key;
// obj - value
+(id)GetObjectFromUDF:(NSString *)key;
+(void)SetObjectToUDF:(id)Object andKey:(NSString *)key;

// 获取字符的中文 和 英文的字节长度
+(int)getToInt:(NSString*)strtemp;
+(NSString *)getCurrentTimeString;

+ (NSString *)toJSONString:(id)theData;
+(BOOL) IsContainString:(NSString *)content StringTemp:(NSString *)temp;

// 存
+(void)SetDictIntoStore:(NSDictionary *)dict key:(NSString *)key storeName:(NSString *)tblName;
// 取
+(NSDictionary *)GetDictFromStoreByKey:(NSString *)key storeName:(NSString *)tblName;
// 删
+(void)DeleteDictFromStoreByKey:(NSString *)key storeName:(NSString *)tblName;
//删除整个库
+(void)DeleteAllStoreByName;//:(NSString *)name;
// 删除全部缓存
+(void)DeleteAllCacheData;


// 获取状态
+ (NSString *)getStatusString:(int)index;

+ (NSString *)valiMobile:(NSString *)mobile;

//  根据时间字符串  获取  时间戳
+(NSString *)getTimeSpanByTimeString:(NSString *)timeString;
// Nsdate = > dateString
+ (NSString *)getStringDate:(NSDate *)newdate formatter:(NSString *)formatter;

// 获取时间 根据分钟
+(NSString *) getTimeStringByMinute:(NSInteger)minute;
// 根据分钟 获取小时
+(NSString *)getHourByMinute:(NSInteger)minute;
+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *) filePathString;
@end
