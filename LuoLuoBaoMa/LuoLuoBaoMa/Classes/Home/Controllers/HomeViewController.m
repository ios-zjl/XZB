//
//  HomeViewController.m
//  LuoLuoBaoMa
//
//  Created by DavyZhang on 16/5/24.
//  Copyright © 2016年 luoluo. All rights reserved.
//  首页

#import "HomeViewController.h"
#import "SDCycleScrollView.h"
//#import "JCCollectionViewWaterfallLayout.h"
#import "MJRefresh.h"

#import "BigButton.h"
#import "HomeHotSellTableCell.h"
#import "HomeHotCellModel.h"

#define kshopDetailCellId @"shopDetailCellId"
#define kheaderViewId @"headerViewId"

@interface HomeViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    CGFloat silderHeight;
    CGFloat menuViewHeight;
    CGFloat notifiViewHeight;

}

@property (nonatomic,strong) UITableView *tableView;

//@property (nonatomic,strong) UICollectionView *collectionView;
//@property (nonatomic,strong) JCCollectionViewWaterfallLayout *flowlayout;
@property (nonatomic,strong) NSMutableArray *models;
@property (nonatomic,strong) NSMutableArray *silderModels;
@property (nonatomic,strong) SDCycleScrollView *sdcycleSilder;


@property (nonatomic,strong) UIView *menuView; // 菜单view
@property (nonatomic,strong) UIView *headerView; // 头部
@property (nonatomic,strong) UIView *notificateView; //通知

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imgTitle = [[UIImageView alloc]init];
    imgTitle.frame = CGRectMake(0, 0, 93, 35);
    imgTitle.image = [UIImage imageNamed:@"MHLogo"];
    [self.navigationItem setTitleView:imgTitle];
//    [self.navigationItem setTitle:@"洛妈辅食"];
    silderHeight = 120;
    menuViewHeight = 85;
    notifiViewHeight = 40;
    _models = [NSMutableArray array];
    _silderModels = @[@"http://mimg.127.net/hxm/dashi/promote/activity/gems_gift/focus/h5_focus.jpg",@"http://res.126.net/p/dbqb/resupload/onlinepath/2016/3/16/6/6a70c920901ab3168aa1a1ed35138094.jpg",@"http://res.126.net/p/dbqb/resupload/onlinepath/2016/3/14/6/b1b3ce5dda8269e529278ad61388e805.jpg",@"http://onegoods.nosdn.127.net/p/2016/03/22/8e039b7009203cc3e02d789fc00c640f.jpg"];
    
//    [self setNavigationLeftWithImage:@"MHSearshImage"];
//    [self setNavigationRightWithImgs:@[@"MHServiceCentreImage"]];
    [self setNavigation];
    [self setup];
    [self GetData];
}
- (void) setNavigation{
    
    // 导航按钮
    UIButton * right = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    [right setImage:[UIImage imageNamed:@"MHSearshImage"] forState:0];
    [right setTitleColor:[UIColor colorWithRed:3/255.0 green:140/255.0 blue:217/255.0 alpha:1.000] forState:UIControlStateNormal];
    right.tag = 1001;
    [right addTarget:self action:@selector(navButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * left = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 35)];
    [left setImage:[UIImage imageNamed:@"MHServiceCentreImage"] forState:0];
    [left setTitleColor:[UIColor colorWithRed:3/255.0 green:140/255.0 blue:217/255.0 alpha:1.000] forState:UIControlStateNormal];
    left.tag = 1002;
    [left addTarget:self action:@selector(navButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:right];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:left];
    [self.navigationItem setRightBarButtonItem:rightItem];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
}
- (void)navButtonAction:(UIButton *)sender{
    // 导航条按钮
    NSInteger tagIndex = sender.tag;
    if (tagIndex == 1001) {
        MLog(@" 搜索 ");
        
    }else{
        MLog(@" 客服 ");
    }
    
}

- (void)setup{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.height-64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0.001)];
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0.001)];
    _tableView.backgroundColor = kTBL_BACK_COLOR;
    [self.view addSubview:_tableView];
    
    //_headerView
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, silderHeight+menuViewHeight+notifiViewHeight)];
    _headerView.backgroundColor = [UIColor hexFloatColor:@"eeeeee"];
    _tableView.tableHeaderView = _headerView;
    // silder
    _sdcycleSilder = [[SDCycleScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, silderHeight)];
    _sdcycleSilder.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _sdcycleSilder.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    _sdcycleSilder.currentPageDotColor = [UIColor whiteColor];
    _sdcycleSilder.imageURLStringsGroup = _silderModels;
    
    //menuView
    _menuView = [[UIView alloc]initWithFrame:CGRectMake(0,silderHeight, SCREEN_WIDTH, menuViewHeight)];
    _headerView.backgroundColor = [UIColor whiteColor];
    [_headerView addSubview:_menuView];
    
    //notificateView
    _notificateView = [[UIView alloc]initWithFrame:CGRectMake(0,silderHeight+menuViewHeight, SCREEN_WIDTH, notifiViewHeight)];
    [_notificateView addTopBorderWithHeight:klineHeight andColor:klineViewColor];
    //ico
    UIImageView *iconImage_noti = [[UIImageView alloc]initWithFrame:CGRectMake(18, (notifiViewHeight-21)/2, 21, 21)];
    iconImage_noti.image = [UIImage imageNamed:@"bestMatch_selected"];
    [_notificateView addSubview:iconImage_noti];
    //label
    UILabel *noti_label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iconImage_noti.frame)+10, (notifiViewHeight-18)/2, SCREEN_WIDTH-CGRectGetMaxX(iconImage_noti.frame)-20, 18)];
    noti_label.textColor = [UIColor hexFloatColor:@"999999"];
    noti_label.font = [UIFont systemFontOfSize:13.0f];
    noti_label.lineBreakMode = NSLineBreakByTruncatingTail;
    noti_label.text = @"恭喜：逗比 ，9分钟前获得iphone 9s 土豪金64G版土豪金64G版";
    [_notificateView addSubview:noti_label];
    
    [_headerView addSubview:_notificateView];
    [_headerView addSubview:_sdcycleSilder];
    //menuButton
    [self setmenuButton];
    
   
    
    
}
- (void)setmenuButton{
    int btnX = SCREEN_WIDTH/4;
    for (int i=0; i<4; i++) {
        BigButton *btn = [[BigButton alloc]init];
        btn.tag = i+1000;
        [btn addTarget:self action:@selector(menuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.buttontype = BigButtonTypeNormal;
        btn.frame = CGRectMake(btnX*i,0, SCREEN_WIDTH/4, menuViewHeight);
        btn.titleLabel.textColor = [UIColor hexFloatColor:@"666666"];
        btn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        btn.heightPercent = 0.68;
        if (i==0) {
            btn.title = @"进口奶粉";
            btn.image = [UIImage imageNamed:@"one_kind"];
        }else if (i==1){
            btn.title = @"神妈值得买";
            btn.image = [UIImage imageNamed:@"one_ten"];
        }else if (i==2){
            btn.title = @"99元5件";
            btn.image = [UIImage imageNamed:@"one_share"];
        }else{
            btn.title = @"热销榜单";
            btn.image = [UIImage imageNamed:@"one_qa"];
        }
        //        btn.buttonImage.size = CGSizeMake(20, 20);
        [_menuView addSubview:btn];
    }
}
- (void)menuButtonClick:(UIButton *)sender{
    MLog(@" 按钮 %li",sender.tag);
}
#pragma mark - 焦点图点击
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    //
    MLog(@"第%li张图",index);
}

#pragma mark - tbl代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _models.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
//    cell.textLabel.text = @"title";
    
    HomeHotSellTableCell *cell = [HomeHotSellTableCell CellWithTable:tableView reuseId:@"HomeHotSellTableCellId"];
    HomeHotCellModel *model = [_models objectAtIndex:indexPath.row];
    cell.model = model;
    return  cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  [HomeHotSellTableCell CellHeight];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MLog(@" 点击 %zi ",indexPath.row);
}


- (void)GetData{

    for (int i =0; i<10; i++) {
        
        HomeHotCellModel *model = [[HomeHotCellModel alloc]init];
        model.HotName = @"热销纸尿裤";
        model.bigImageName = @"03.jpg";
        HotDetailModel *item = [[HotDetailModel alloc]init];
        item.itemName = @"洛妈手工面";
        item.itemImage = @"circle_Profile";
        model.items = [NSMutableArray array];
        [model.items addObject:item];
        [model.items addObject:item];
        [model.items addObject:item];
        [model.items addObject:item];
        
        [_models addObject:model];
        
    }
    [_tableView reloadData];

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
