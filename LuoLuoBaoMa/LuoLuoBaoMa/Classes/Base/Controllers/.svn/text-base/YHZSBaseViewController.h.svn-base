//
//  YHZSBaseViewController.h
//  YiHaoZhuShou
//
//  Created by 张金龙 on 16/3/25.
//  Copyright © 2016年 YHZS. All rights reserved.
//    基类 - 视图控制器

#import <UIKit/UIKit.h>
#import "MBProgressHUD+MJ.h"
#import "UIView+Ext.h"

@interface YHZSBaseViewController : UIViewController

@property (nonatomic,strong) UIColor *tingColor;

//title
- (void)setNavigationWithTitle:(NSString *)title;
- (void)setNavigationWithTitleView:(UIView *)titleView;

//left
- (void)setNavigationLeftWithStr:(NSString *)leftTitle;
- (void)setNavigationLeftWithImage:(NSString *)leftImage;
- (void)setNavigationLeftWithStr:(NSString *)leftTitle andImage:(NSString *)leftImage;

//right
- (void)setNavigationRightWithStr:(NSString *)rightTitle;
- (void)setNavigationRightWithStr:(NSString *)rightTitle andImage:(NSString *)rightImage;
- (void)setNavigationRightWithImgs:(NSArray *)images; // 字符串数组

// 点击事件
- (void)NavigationBarButtonClick:(UIButton *)sender;

@end
