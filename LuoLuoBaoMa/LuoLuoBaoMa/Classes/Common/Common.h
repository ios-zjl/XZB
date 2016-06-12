//
//  Common.h
//  YiHaoZhuShou
//
//  Created by 张金龙 on 16/3/25.
//  Copyright © 2016年 YHZS. All rights reserved.
//

#import "UIView+Borders.h"

#ifndef Common_h
#define Common_h


//表格背景色颜色
#define kTBL_BACK_COLOR [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00]
#define kdateFmat @"yyyy-MM-dd HH:mm:ss"

#pragma mark - url 请求链接
//=========================【app url 请求链接】===================

#define kHTTP_TIMEOUT_INTERVAL  1 // 请求超时时间
#define kUIViewAnimation_TIME  1.0 // 转场动画时间
#define kLaunchImage_TIME  1.0 //    页面停留时间
#define kButtom_BottomPadding 20       // 按钮距离底部的距离

/*
 *  颜色
 */
#define klineViewColor [UIColor colorWithRed:0.95 green:0.95 blue:0.94 alpha:1.00]
#define klineHeight 0.5
#define kbackColor [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1]

#define knameLabelColor [UIColor colorWithRed:0.32 green:0.32 blue:0.32 alpha:1.00]

//********************************************************************************************通知 - start
#pragma mark - url -> 通知
//通知分类列表接口
#define XZB_NoticeType  [NSString stringWithFormat:@"%@/noticeType",_APPSERVER_IP]
//等待我处理接口
#define XZB_Pending  [NSString stringWithFormat:@"%@/pending",_APPSERVER_IP]
// 我申请的订单接口
#define XZB_myApply  [NSString stringWithFormat:@"%@/myApply",_APPSERVER_IP]
//通知，申请审核详情
#define XZB_applyDetail  [NSString stringWithFormat:@"%@/applyDetail",_APPSERVER_IP]

//********************************************************************************************通知 - end

//=========================【app 尺寸/屏幕】===================
//获取屏幕 宽度、高度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//iphone4s
#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//iphone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
// iphone6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)) : NO)
// iphone6 plus
#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)
// 判断是否为iOS7
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >=8.0)
#define kIS_IOS7                (kCFCoreFoundationVersionNumber > kCFCoreFoundationVersionNumber_iOS_6_1)

// 根据屏幕匹配高度
#define SCALEWIDTH(width)    [Public deviceWidth:width]
#define SCALEHEIGHT(height)  [Public deviceHeight:height]

//navgationBar
#define Barheight 54
#define StatusHeight 10

//=========================【app 颜色】===================
#define RGB(r,g,b)                  [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:1.f]
#define RGBA(r,g,b,a)               [UIColor colorWithRed:r / 255.f green:g / 255.f blue:b / 255.f alpha:a]
//清空背景色
#define kClearColor [UIColor clearColor]
#define kCellTitle_COLOR [UIColor hexFloatColor:@"545454"]
#define kCellValue_COLOR [UIColor hexFloatColor:@"AEAEAE"]
#define kCellSelected_COLOR [UIColor hexFloatColor:@"f9f9f9"]
#define kViewController_BACK_COLOR [UIColor hexFloatColor:@"eeeeee"]
#define kButton_COLOR [UIColor colorWithRed:26.f / 255.f green:188.f / 255.f blue:231.f / 255.f alpha:1.f]
// 判断版本号
#define USERINFO_BUNDLEVERSION @"CFBundleVersion"

//二维码web登陆url
//#define QRCODE_URL @"http://dev.lswebhr.jiaojiebao.com/l"
//#define _APPSERVER_IP @"http://yhzl.jiaojiebao.com/api"           // 发布
//定义URL地址
//#define _APPSERVER_IP @"http://dev.hr.api.jiaojiebao.com"   // 水兵版

// 开发  测试  临时
#define _APPSERVER_IP @"http://dev.lshr.api.jiaojiebao.com"  // 开发
#define QRCODE_URL @"http://dev.lswebhr.jiaojiebao.com/l" // 开发 二维码扫码登录链接
#define kJPUSH_AppKey @"7f155cf83701df2fbe305af1"         //// 测试
#define GDMap_APIKey @"5ac1ba853d2e045ab75521cf00b3601a"    //com.xingzhengbao.com

// 友盟分享
#define UmengAppkey  @"57393958e0f55a04110024c8" // @"573edaa967e58e638f0027f1"
#define QQAppId @"1105335509"
#define QQAppkey @"Sm98gewHBZHVElt"

#define WeiXinAppID @"wx46705ac33fac0ef1"
#define WeiXinAppSecret   @"fcc1a2f7ec62c875b414c026191ceb21"

#define WBAppID @"3570100731"
#define WBAppSecret @"9332534d17875d2d6e2c30116bac8b90"

// 正式  appStore
//#define _APPSERVER_IP @"http://api.yhzl.jiaojiebao.com"   // 正式
//#define QRCODE_URL @"http://yhzl.jiaojiebao.com/l" //正式 二维码扫码登录链接
//#define kJPUSH_AppKey   @"8958162368bed3663c9d9fe2"     // app Store
//#define GDMap_APIKey @"e7d1a4fdec1a52383c99f68a100ec082"    // com.xingzhengbao.app

//版本号
//#define VERSOIN_RELEASE @"V1.0.0"                    // 发布版本号 - Release Build
//#define VERSOIN_DEBUG   @"V0.1.0_d1159"               // 测试版本号 - Debug Build
//#define CLIENT_VERSION [NSString stringWithFormat:@"版本号:%@",VERSOIN_DEBUG]

// 获取屏幕宽度和宽度
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

// 定义键盘
#define NUMBERS @"0123456789\n"//输入框必须是数字

/**
 *  随机颜色
 */
#define JLRandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]


//=========================【app 弹窗】===================
#define ALERT_MSG(msg,btnMsg) static UIAlertView *alert; alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:btnMsg otherButtonTitles:nil, nil];\
[alert show];\

//=========================【app 日志打印】===================
// 是否上线  0:关闭     1:开启
#define IsOnline 1

#if  IsOnline
    #define kerror_msg_show [error description]
    #define MLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
    #define MLog(...)
    #define kerror_msg_show @"网络超时"
#endif

#pragma mark -
#pragma mark 数据库
#define kUserInfoFile @"UserInfo.plist"
#define kdb_tbl_DataInfo  @"xzb_DataInfo.db" // 用户信息

#pragma mark -
#pragma mark 数据表名 /  键值
#define ktbl_userInfo @"userInfo"  // 用户信息
#define kkey_userInfo @"key_UserInfo"  // 获取用户信息的键
#define Kkey_sysconfig_vacation @"key_sysconfig_vacationType"  // 系统配置参数   /请假类型
#define Kkey_sysconfig_piece @"key_sysconfig_PieceType"  // 系统配置参数      /计件工序/

//  用户信息

#define kDefaultDBDir       @"Documents/EMMDB"   // 数据库和Plist文件的默认路径
#define kUserInfoDBPath     @"XZBUserInfo.db"    // 用户信息数据库名称


#pragma mark -
#pragma mark  键 值对 
#define kwaitDeal_IsShow_BadgeValue @"waitDeal_IsShow_BadgeValue"  // 等待我处理   1:显示    0:不显示     1
#define kNotice_IsShow_BadgeValue  @"Notice_IsShow_BadgeValue" // 通知   3
#define kSysNotice_IsShow_BadgeValue  @"SysNotice_IsShow_BadgeValue" // 公告  4
#define kTab_Notice_BadgeValue  @"Tab_Notice_BadgeValue" //  通知的badgeValue 数


#define ktbl__NoThing_ImageName  @"NoDataImage" //   没有数据时的显示

// 是否为在线考勤 1 = 二维码签到 2 ＝ 在线考勤
//#define kCheck_on_work_attendance 2


#pragma mark -
#pragma mark  webView 交互相关
// 加密的key
#define kEncryptKey4WebView @"1gbzSvfkalX5RAzlYNzWaX5UhxCofQZZ"
#define kkey4CookieName_userAgent @"ios_xingzhengbao"

// h5 - > 调用原生  (做好注释)
#define kString4LogOut @"objc://LogOut" // 退出登录
#define kString4OpenContacts @"objc://JumpAddressBook" // 打开联系人页面
#define kString4ShowCreateBtn @"objc://ShowCreateButtonAndAddUser?" // 显示右上角按钮 url=&btnName=
#define kString4DeviceHorizontalShow @"objc://DeviceHorizontalShow?"     // 横屏显示 url =
//#define kString4DeviceVerticalShow @"objc://DeviceVerticalShow?"        // 竖屏显示 url
#define kString4GoBack @"objc://GoBack"        // 返回上一页

// 弹窗
//#define ALERT_MSG(msg) static UIAlertView *alert; alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
//[alert show];\

// 分享
#define kshareTitle [NSString stringWithFormat:@"%@邀请您使用1号助理，轻松完成计时和计件工作。",[GlobalHelper GetObjectFromUDF:USER_NAME]]
#define  kshareUrl @"http://yhzl.jiaojiebao.com"
#define kshareTitle_URL [NSString stringWithFormat:@"%@邀请您使用1号助理，轻松完成计时和计件工作。点击链接【%@】下载安装1号助理。",[GlobalHelper GetObjectFromUDF:USER_NAME],kshareUrl]
//%@邀请您使用1号助理，轻松完成计时和计件工作。点击链接【http://xxxx.com】下载安装1号助理。

#endif /* Common_h */
