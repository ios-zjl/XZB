//
//  HomeHotSellTableCell.h
//  LuoLuoBaoMa
//
//  Created by DavyZhang on 16/5/24.
//  Copyright © 2016年 luoluo. All rights reserved.
//   首页热销产品的 Cell

#import <UIKit/UIKit.h>
#import "HomeHotCellModel.h"

@interface HomeHotSellTableCell : UITableViewCell


@property (nonatomic,strong) HomeHotCellModel *model;


+(instancetype)CellWithTable:(UITableView *)tableView reuseId:(NSString *)reuseId;

+(CGFloat)CellHeight;

@end
