//
//  YHZSBaseViewController.m
//  YiHaoZhuShou
//
//  Created by 张金龙 on 16/3/25.
//  Copyright © 2016年 YHZS. All rights reserved.
//   基类试图控制器

#import "YHZSBaseViewController.h"
#import "UIImage+Helper.h"

@interface YHZSBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation YHZSBaseViewController


- (instancetype)init{
    if (self=[super init]) {
//        if ([self respondsToSelector:@selector(setExtendedLayoutIncludesOpaqueBars:)])
//        {
//            self.extendedLayoutIncludesOpaqueBars = NO;
//        }
        if([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
        {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
//        if([self respondsToSelector:@selector(setModalPresentationCapturesStatusBarAppearance:)])
//        {
//            self.modalPresentationCapturesStatusBarAppearance = YES;
//        }
        _tingColor = [UIColor darkGrayColor];
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    //NSLog(@"interactivePopGestureRecognizer ： %@",self.navigationController.interactivePopGestureRecognizer);
    // 获取系统自带滑动手势的target对象
//    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
//    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
//    // handleNavigationTransition   系统的方法
//    // 设置手势代理，拦截手势触发
//    pan.delegate = self;
//    // 给导航控制器的view添加全屏滑动手势
//    [self.view addGestureRecognizer:pan];
    // 禁止使用系统自带的滑动手势
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}
// 什么时候调用：每次触发手势之前都会询问下代理，是否触发。
// 作用：拦截手势触发
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    return YES;
}
#pragma mark - titleView
- (void)setNavigationWithTitle:(NSString *)title{
    //设置导航栏内容
    [self.navigationItem setTitle:title];
}
- (void)setNavigationWithTitleView:(UIView *)titleView{
    [self.navigationItem setTitleView:titleView];
}


#pragma mark - left
- (void)setNavigationLeftWithStr:(NSString *)leftTitle{
    UIButton *btn = [self createButtonWithTitle:leftTitle];
    btn.tag = kNav_Left_ButtonTag; //kNaviLeftButtonTag;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
}
- (void)setNavigationLeftWithStr:(NSString *)leftTitle andImage:(NSString *)leftImage{
    
    UIButton *btn = [self createButtonWithTitle:leftTitle];
    
    [btn setImage:[[UIImage imageNamed:leftImage] resize:110/44.0] forState:0];
    btn.frame = CGRectMake(0, 0, 30, 40);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0);
    //    btn.backgroundColor = MJRandomColor;
    btn.tag = kNav_Left_ButtonTag;//kNaviLeftButtonTag;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
    
}
- (void)setNavigationLeftWithImage:(NSString *)leftImage{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(NavigationBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[[UIImage imageNamed:leftImage] resize:110/44.0] forState:0];
    btn.frame = CGRectMake(0, 0, 30, 40);
    //    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -18, 0, 0);
    //    btn.backgroundColor = MJRandomColor;
    btn.tag = kNav_Left_ButtonTag;//kNaviLeftButtonTag;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = item;
    
}

#pragma mark - rightBtn
- (void)setNavigationRightWithStr:(NSString *)rightTitle{
    
    UIButton *btn = [self createSystomButtonWithTitle:rightTitle];
    btn.tag = kNav_Right_ButtonTag;//kNaviRightButtonTag;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}
- (void)setNavigationRightWithStr:(NSString *)rightTitle andImage:(NSString *)rightImage{
    UIButton *btn = [self createButtonWithImage:rightImage];
    btn.tag = kNav_Right_ButtonTag;//kNaviRightButtonTag;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)setNavigationRightWithImgs:(NSArray *)images{
    NSMutableArray *rightBtns = [NSMutableArray array];
    int count = 0;
    for (NSString *image in images) {
        UIButton *btn = [self createButtonWithImage:image];
        btn.tag = kNav_Right_ButtonTag;//kNaviRightButtonTag+count;
        count ++;
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        [rightBtns addObject:item];
    }
    self.navigationItem.rightBarButtonItems = rightBtns;
}
//
- (UIButton *) createSystomButtonWithTitle:(NSString *)text{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.backgroundColor = JLRandomColor;
    btn.frame = CGRectMake(0, 0, 50, 40);
    //    btn.tag = kNaviButtonTag+2;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:17.0f]];
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(NavigationBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (UIButton *) createButtonWithTitle:(NSString *)text{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    btn.backgroundColor = MJRandomColor;
    btn.frame = CGRectMake(0, 0, 50, 40);
    //    btn.tag = kNaviButtonTag+2;
    [btn setTitle:text forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:17.0f]];
    [btn setTitleColor:_tingColor forState:UIControlStateNormal];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    [btn addTarget:self action:@selector(NavigationBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
- (UIButton *) createButtonWithImage:(NSString *)image{
    UIImage *normalImage = [UIImage imageNamed:image];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 25, 25);
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(NavigationBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


- (void)NavigationBarButtonClick:(UIButton *)sender{
    NSInteger tagIndex = sender.tag;
    MLog(@"点到了");
    if (tagIndex == kNav_Left_ButtonTag) {
        MLog(@" 左左左 导航按钮 ");
    }else if(tagIndex == kNav_Right_ButtonTag){
        MLog(@" 右右右1 导航按钮 ");
    }else if(tagIndex == kNav_Right_ButtonTag+1){
        MLog(@" 右右右2 导航按钮 ");
    }
}


@end
