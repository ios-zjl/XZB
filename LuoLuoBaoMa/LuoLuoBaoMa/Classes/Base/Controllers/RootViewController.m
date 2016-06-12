//
//  RootViewController.m
//  LuoLuoBaoMa
//
//  Created by DavyZhang on 16/5/24.
//  Copyright © 2016年 luoluo. All rights reserved.
//

#import "RootViewController.h"
#import "BaseNavigationController.h"

#import "HomeViewController.h" // 主页
#import "ShopCarViewController.h"   // 购物车
#import "MaCircleViewController.h"  // 妈妈圈
#import "MeViewController.h"    // 个人主页

@interface RootViewController ()

@end

@implementation RootViewController

- (instancetype)init{
    if (self=[super init]) {
        
//        [self addViewControllers];
        
    }
    return  self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (CYLTabBarController *)tabBarController{
    if (_tabBarController == nil) {
        HomeViewController *home = [[HomeViewController alloc] init];
        UIViewController *homeNav = [[BaseNavigationController alloc]
                                     initWithRootViewController:home];
        
        MaCircleViewController *ma = [[MaCircleViewController alloc] init];
        UIViewController *maNav = [[BaseNavigationController alloc]
                                       initWithRootViewController:ma];
        
        ShopCarViewController *shopCar = [[ShopCarViewController alloc] init];
        UIViewController *shopCarNav = [[BaseNavigationController alloc]
                                     initWithRootViewController:shopCar];
        
        MeViewController *me = [[MeViewController alloc] init];
        UIViewController *meNav = [[BaseNavigationController alloc]
                                   initWithRootViewController:me];
        CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
        
        // 在`-setViewControllers:`之前设置TabBar的属性，设置TabBarItem的属性，包括 title、Image、selectedImage。
        [self setUpTabBarItemsAttributesForController:tabBarController];
        
        [tabBarController setViewControllers:@[
                                               homeNav,
                                               maNav,
                                               shopCarNav,
                                               meNav
                                               ]];
        // 更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
        [[self class] customizeTabBarAppearance:tabBarController];
        [tabBarController.tabBar addTopBorderWithHeight:1 andColor:[UIColor hexFloatColor:@"eeeeee"]];
        _tabBarController = tabBarController;
        
    }
    return _tabBarController;
}

//- (void)addViewControllers{
//    
//    UITabBarController *tabbarController = [[UITabBarController alloc]init];
//    //main
//    //    MainViewController *main =({
//    //        MainViewController *main = [[MainViewController alloc]init];
//    HomeViewController *home = ({
//        HomeViewController *home = [[HomeViewController alloc]init];
//        // image
//        UIImage *homeImage = [UIImage imageNamed:@"homeIndex"];
//        UIImage *homeHImage = [UIImage imageNamed:@"homeIndex_select"];
//        home.title = @"首页";
//        home.tabBarItem.image = homeImage;
//        home.tabBarItem.selectedImage = homeHImage;
//        home;
//    });
//    
//    MaCircleViewController *ma = ({
//        MaCircleViewController *ma = [[MaCircleViewController alloc] init];
//        
//        UIImage *contactsImage   = [UIImage imageNamed:@"maiquan"];
//        UIImage *contactsHLImage = [UIImage imageNamed:@"maiquan_select"];
//        
//        ma.title = @"妈妈圈";
//        ma.tabBarItem.image = contactsImage;
//        ma.tabBarItem.selectedImage = contactsHLImage;
//        ma.view.backgroundColor = JLRandomColor;
//        ma;
//    });
//    
//    ShopCarViewController *shopCar = ({
//        ShopCarViewController *shopCar = [[ShopCarViewController alloc] init];
//        
//        shopCar.title = @"购物车";
//        shopCar.tabBarItem.image = [UIImage imageNamed:@"cart"];
//        shopCar.tabBarItem.selectedImage = [UIImage imageNamed:@"cart_select"];
//        shopCar;
//    });
//    
//    
//    MeViewController *me = ({
//        MeViewController *me = [[MeViewController alloc] init];
//        
//        UIImage *contactsImage   = [UIImage imageNamed:@"person"];
//        UIImage *contactsHLImage = [UIImage imageNamed:@"person_select"];
//        
//        me.title = @"我";
//        me.tabBarItem.image = contactsImage;
//        me.tabBarItem.selectedImage = contactsHLImage;
//        me.view.backgroundColor = JLRandomColor;
//        
//        me;
//    });
//    
//    tabbarController.title = @"首页";
//    tabbarController.viewControllers = @[
//                                         [[BaseNavigationController alloc] initWithRootViewController:home],
//                                         [[BaseNavigationController alloc] initWithRootViewController:ma],
//                                         [[BaseNavigationController alloc] initWithRootViewController:shopCar],
//                                         [[BaseNavigationController alloc] initWithRootViewController:me],
//                                         ];
//    
//    _tabBarController = tabbarController;
//    [self.view addSubview:_tabBarController.view];
//    
//}

- (void)setUpTabBarItemsAttributesForController:(CYLTabBarController *)tabBarController {
    NSDictionary *dict1 = @{
//                            CYLTabBarItemTitle : nil,
                            CYLTabBarItemImage : @"homeIndex",
                            CYLTabBarItemSelectedImage : @"homeIndex_select",
                            };
    NSDictionary *dict2 = @{
//                            CYLTabBarItemTitle : nil,
                            CYLTabBarItemImage : @"maiquan",
                            CYLTabBarItemSelectedImage : @"maiquan_select",
                            };
    NSDictionary *dict3 = @{
//                            CYLTabBarItemTitle : nil,
                            CYLTabBarItemImage : @"cart",
                            CYLTabBarItemSelectedImage : @"cart_select",
                            };
    NSDictionary *dict4 = @{
//                            CYLTabBarItemTitle : nil,
                            CYLTabBarItemImage : @"person",
                            CYLTabBarItemSelectedImage : @"person_select"
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3,
                                       dict4
                                       ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
    tabBarController.imageInsets = UIEdgeInsetsMake(5, 0,-5, 0);
}
/**
 *  更多TabBar自定义设置：比如：tabBarItem 的选中和不选中文字和背景图片属性、tabbar 背景图片属性
 */
+ (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    
    //去除 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = kClearColor;
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = kClearColor;
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    //    NSUInteger allItemsInTabBarCount = [CYLTabBarController allItemsInTabBarCount];
    //    [[UITabBar appearance] setSelectionIndicatorImage:[self imageFromColor:[UIColor yellowColor] forSize:CGSizeMake([UIScreen mainScreen].bounds.size.width / allItemsInTabBarCount, 49.f) withCornerRadius:0]];
    
    // set the bar background color
    // 设置背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setBackgroundImage:[UIColor imageWithColor:[UIColor whiteColor]]];
}

+ (UIImage *)imageFromColor:(UIColor *)color forSize:(CGSize)size withCornerRadius:(CGFloat)radius {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    UIGraphicsBeginImageContext(size);
    
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius] addClip];
    // Draw your image
    [image drawInRect:rect];
    
    // Get the image, here setting the UIImageView image
    image = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    return image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
