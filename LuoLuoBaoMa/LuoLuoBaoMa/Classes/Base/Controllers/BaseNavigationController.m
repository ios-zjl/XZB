//
//  BaseNavigationController.m
//  YiHaoZhuShou
//
//  Created by 张金龙 on 16/3/25.
//  Copyright © 2016年 YHZS. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UIImage+Helper.h"
#import "ContentWebViewController.h"

@interface BaseNavigationController ()
{

//    UIInterfaceOrientation *currentOrientationState;
    
}

@end

@implementation BaseNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if (self=[super initWithRootViewController:rootViewController]) {
//        currentOrientationState = UIInterfaceOrientationPortrait;
        //按钮的颜色
        [self.navigationBar setTintColor:[UIColor blackColor]];
        //标题颜色
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
        //背景颜色
        self.navigationBar.barTintColor = [UIColor whiteColor];
        // 返回按钮图片
        [[UINavigationBar appearance] setBackIndicatorImage:[[UIImage imageNamed:@"return_back"]resize:3.6]];
        [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[[UIImage imageNamed:@"return_back"]resize:3.6]];
        [[UINavigationBar appearance] setBackgroundColor:[UIColor whiteColor]];
        
    }
    return self;
}

//-(void)setOrientationState:(UIInterfaceOrientation *)OrientationState{
//    _OrientationState = OrientationState;
//    currentOrientationState = OrientationState;
//}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{

    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - 强制横屏
//不让转屏
-(BOOL)shouldAutorotate{
    return NO;
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
//    return  currentOrientationState;//UIInterfaceOrientationLandscapeRight;
    if (_IsHorizontalShow) {
        return UIInterfaceOrientationLandscapeRight;
    }
    return UIInterfaceOrientationPortrait;
}

@end
