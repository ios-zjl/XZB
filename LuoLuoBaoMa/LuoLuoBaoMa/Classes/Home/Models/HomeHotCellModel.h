//
//  HomeHotCellModel.h
//  LuoLuoBaoMa
//
//  Created by DavyZhang on 16/5/24.
//  Copyright © 2016年 luoluo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HotDetailModel.h"  // 详情数据

@interface HomeHotCellModel : NSObject

@property (nonatomic,copy) NSString *HotName;
@property (nonatomic,copy) NSString *bigImageName;
@property (nonatomic,strong) NSMutableArray *items;


@end
