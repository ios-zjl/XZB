//
//  BaseNavigationController.h
//  YiHaoZhuShou
//
//  Created by 张金龙 on 16/3/25.
//  Copyright © 2016年 YHZS. All rights reserved.
//   基类 - 导航控制器

#import <UIKit/UIKit.h>

@interface BaseNavigationController : UINavigationController

//@property (nonatomic,assign) UIInterfaceOrientation *OrientationState; // 选择方向
@property (nonatomic,assign) BOOL IsHorizontalShow; // 是否横屏显示    默认：横屏

@end
