//
//  CYWebViewController.m
//  CYWebViewController
//
//  Created by 万鸿恩 on 16/1/18.
//  Copyright © 2016年 万鸿恩. All rights reserved.
//

#import "CYWebViewController.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"
#import "UIColor+WHE.h"
#import "UIButton+WHE.h"
#import "UIImage+Helper.h"
#import "IOSMD5.h"

@interface CYWebViewController ()<UIWebViewDelegate,NJKWebViewProgressDelegate>
@property (strong, nonatomic) UIWebView * webView;
@property (nonatomic,strong) NJKWebViewProgressView *progressView;
@property (nonatomic,strong) NJKWebViewProgress *progressProxy;


@end

@implementation CYWebViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.progressProxy = [[NJKWebViewProgress alloc] init];
    self.webView.delegate = self.progressProxy;
    self.progressProxy.webViewProxyDelegate = self;
    self.progressProxy.progressDelegate = self;
    
    CGFloat progressBarHeight = 3.f;
    CGRect navigationBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigationBarBounds.size.height - progressBarHeight, navigationBarBounds.size.width, progressBarHeight);
    self.progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    self.progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    if (self.loadingBarTintColor) {
        self.progressView.progressBarView.backgroundColor = self.loadingBarTintColor;
    }
    
    if (self.bgcolor) {
        [self.view setBackgroundColor:[UIColor colorFromHexString:self.bgcolor]];
        [self.webView setBackgroundColor:[UIColor colorFromHexString:self.bgcolor]];
    }else{
        [self.view setBackgroundColor:[UIColor colorFromHexString:@"f4f4f4"]];
        [self.webView setBackgroundColor:[UIColor colorFromHexString:@"f4f4f4"]];
    }
    
    
    [self.view addSubview:self.webView];
    [self loadURL];
    
    [self setupLeftNavigationBarBtnWithHiddenOneBtn];
//     self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    // handleNavigationTransition   系统的方法
    // 设置手势代理，拦截手势触发
    pan.delegate = self;
    // 给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:pan];
    // 禁止使用系统自带的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:self.progressView];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // Remove progress view
    // because UINavigationBar is shared with other ViewControllers
    [self.progressView removeFromSuperview];
}

- (IBAction)searchButtonPushed:(id)sender
{
    [self loadURL];
}

- (IBAction)reloadButtonPushed:(id)sender
{
    [self.webView reload];
}

-(void)loadURL
{
    // 写入 userAgent
    UIWebView* webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString* secretAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    NSString *newUagent = [NSString stringWithFormat:@"%@ %@",secretAgent,kkey4CookieName_userAgent];
    NSDictionary *dictionary = [[NSDictionary alloc]
                                initWithObjectsAndKeys:newUagent, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
    //PRODUCT_INFO_URL
    NSURLRequest *req = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:req];
}

#pragma mark - NJKWebViewProgressDelegate
-(void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    [self.progressView setProgress:progress animated:YES];
    
    self.title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
        [_webView setBackgroundColor:[UIColor whiteColor]];
        _webView.delegate =self;
        _webView.scalesPageToFit = YES;
    }
    return _webView;
}

-(void)clickedbackBtn:(UIButton*)btn{
    NSLog(@"back");
    if (self.webView.canGoBack) {
        [self setupLeftNavigationBarBtn];
        [self.webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}
-(void)clickedcloseBtn:(UIButton*)btn{
    NSLog(@"close");
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)setupLeftNavigationBarBtn{
    
    UIView * customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 108, 44)];
    
    UIButton *backBtn = [UIButton buttonBackWithImage:[[UIImage imageNamed:@"return_back"]resize:3.6] buttontitle:@"返回" target:self action:@selector(clickedbackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setTitleColor:[UIColor blackColor] forState:0];
    backBtn.frame = CGRectMake(0, 0, 54, 44);
    [customView addSubview:backBtn];
    
    
    UIButton *closeBtn = [[UIButton alloc] init];
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [closeBtn addTarget:self action:@selector(clickedcloseBtn:) forControlEvents:UIControlEventTouchUpInside];
    closeBtn.frame = CGRectMake(48, 0, 54, 44);
    [closeBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [customView addSubview:closeBtn];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    
}

-(void)setupLeftNavigationBarBtnWithHiddenOneBtn{
    
    UIView * customView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 54, 44)];
    
    UIButton *backBtn = [UIButton buttonBackWithImage:[[UIImage imageNamed:@"return_back"]resize:3.6] buttontitle:@"返回" target:self action:@selector(clickedbackBtn:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.frame = CGRectMake(0, 0, 54, 44);
    [backBtn setTitleColor:[UIColor blackColor] forState:0];
    [customView addSubview:backBtn];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customView];
    
}


@end
