//
//  JLSelectMenuView.m
//
//
//  Created by 张金龙 on 16/3/30.
//  Copyright © 2016年 admin. All rights reserved.
//   

#import "JLSelectMenuView.h"
#import "UIView+Borders.h"


#define kbuttonTag 2016


@interface JLSelectMenuView ()<UIGestureRecognizerDelegate>{

    
}
@end

@implementation JLSelectMenuView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
         self.backgroundColor = [UIColor whiteColor];
        self.lineView = [[UIView alloc]init];
        self.lineView.backgroundColor = [UIColor hexFloatColor:@"1bd06e"];
        self.lineView.tag = 11101;
        self.lineView.frame = CGRectMake((SCREEN_WIDTH/2-108)/2, 42, 108, 2);
        self.lineView.layer.masksToBounds = YES;
        self.lineView.layer.cornerRadius = 2;
        [self addSubview:_lineView];
    }
    
    return self;
}

- (void)setMenuItems:(NSArray *)menuItems{
    _menuItems = menuItems;
    int len = (int)menuItems.count;
    for (int i=0; i<len; i++) {
        CGFloat labX = self.frame.size.width/len*i;
        CGFloat labH = self.frame.size.height;
        UIButton *label = [[UIButton alloc]initWithFrame:CGRectMake(labX,10, self.frame.size.width/len, labH-20)];
        if (i!=len-1) {
             [label addRightBorderWithWidth:2.0f andColor:[UIColor hexFloatColor:@"999999"]];
        }
       
        [label setTitleColor:[UIColor hexFloatColor:@"999999"] forState:0];
        label.tag = i+kbuttonTag;
        [label setTitle:_menuItems[i] forState:0];
        label.backgroundColor = [UIColor clearColor];
        [label addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:label];
        
//        [label bringSubviewToFront:self];
    }
    self.lineView.frame = CGRectMake(0, self.frame.size.height-2, self.frame.size.width/len, 2);
}
- (void)ButtonClick:(UIButton *)sender{
//    MLog(@" 点击 %@ ",label.text);
//    for (UIButton *subView in self.subviews) {
//        if (subView.tag!=11101) {
//            [subView setTitleColor:[UIColor hexFloatColor:@"999999"] forState:0];
//        }
//    }
    CGPoint lineCenter = self.lineView.center;
    lineCenter.x = sender.center.x;
    //
    [UIView animateWithDuration:0.25 animations:^{
        self.lineView.center = lineCenter;
//        [sender setTitleColor:[UIColor hexFloatColor:@"1bd06e"] forState:0];
        if ([self.delegate respondsToSelector:@selector(JLSelectMenuViewClicked:)]) {
            [self.delegate JLSelectMenuViewClicked:sender.tag-kbuttonTag];
        }
    } completion:^(BOOL finished) {
    }];
}
// 移动某个tag
-(void)moveToIndex:(int)index{
    UIButton *button = [self viewWithTag:index+kbuttonTag];
    
    [self ButtonClick:button];
}
//- (int)commonTag{
//    return kbuttonTag;
//}

@end
