//
//  MBProgressHUD+MJ.m
//
//  Created by mj on 13-4-18.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "MBProgressHUD+MJ.h"

@implementation MBProgressHUD (MJ)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1秒之后再消失
    [hud hide:YES afterDelay:0.7];
}

+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view andTime:(float)time
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
        // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
        // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
        // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
        // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
        // 1秒之后再消失
    [hud hide:YES afterDelay:time];
}
#pragma  mark - 自行设置时间
+ (void)showError:(NSString *)error toView:(UIView *)view andTime:(float)time
{
    [self show:error icon:@"error.png" view:view andTime:time];
}

+ (void)showError:(NSString *)error andTime:(float) time
{
    [self showError:error toView:nil andTime:time];
}

+(void)showDefaultMessage:(NSString *)msg {
    [self showMessage:msg andView:nil andTime:1.0 andOffset:0.14];
}

+(void)showCenterMessage:(NSString *)msg{
    [self showMessage:msg andView:nil andTime:1.0];
}

+(void)showMessage:(NSString *)msg andView:(UIView *)view andTime:(float)time{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
   MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [view addSubview:HUD];
    HUD.labelText = msg;
    HUD.userInteractionEnabled = NO;
    HUD.margin = 4;
    HUD.mode = MBProgressHUDModeText;
    HUD.color = [UIColor colorWithRed:0 green:0.01 blue:0.04 alpha:0.45];
    //指定距离中心点的X轴和Y轴的偏移量，如果不指定则在屏幕中间显示
    //    HUD.yOffset = 150.0f;
    //    HUD.xOffset = 100.0f;
//    HUD.yOffset = SCREEN_HEIGHT*0.35;
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(time);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}

+(void)showMessage:(NSString *)msg andView:(UIView *)view andTime:(float)time andOffset:(CGFloat)offset{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [view addSubview:HUD];
    HUD.labelText = msg;
    HUD.cornerRadius = 2;
    HUD.margin = 4;
    HUD.mode = MBProgressHUDModeText;
    HUD.userInteractionEnabled = NO;
    HUD.color = [UIColor colorWithRed:0 green:0.01 blue:0.04 alpha:0.6];
    //指定距离中心点的X轴和Y轴的偏移量，如果不指定则在屏幕中间显示
    //    HUD.yOffset = 150.0f;
    //    HUD.xOffset = 100.0f;
    HUD.yOffset = SCREEN_HEIGHT*0.5-70;
    
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(time);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}

+(void)ShowLoadingWithMessage:(NSString *)msg andView:(UIView *)view{

    //初始化进度框，置于当前的View当中
     if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //如果设置此属性则当前的view置于后台
    HUD.dimBackground = YES;
    //设置对话框文字
    HUD.labelText = @"请稍等";
    //显示对话框
//    [HUD showAnimated:YES whileExecutingBlock:^{
//        //对话框显示时需要执行的操作
//        sleep(3);
//    } completionBlock:^{
//        //操作执行完后取消对话框
//        [HUD removeFromSuperview];
//        [HUD release];
//        HUD = nil;
//    }];
    
}





#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}
@end
