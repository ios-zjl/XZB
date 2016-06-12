//
//  JLSelectMenuView.h
//  
//
//  Created by 张金龙 on 16/3/30.
//  Copyright © 2016年 admin. All rights reserved.
//  顶部可滑动的menuButton

#import <UIKit/UIKit.h>


@protocol JLSelectMenuViewDelegate <NSObject>

// 选中某个按钮之后
- (void)JLSelectMenuViewClicked:(NSInteger)index;

@end

@interface JLSelectMenuView : UIView


@property (nonatomic,weak) id<JLSelectMenuViewDelegate>delegate;
@property (nonatomic,strong) UIView *lineView; // 下划线
@property (nonatomic,strong) NSArray *menuItems;

//@property (nonatomic,assign) int  commonTag; // 


// 移动到某个tag
- (void) moveToIndex:(int)index;

@end
