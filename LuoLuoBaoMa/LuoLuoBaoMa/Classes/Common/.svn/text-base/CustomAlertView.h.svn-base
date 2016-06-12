//
//  CustomAlertView.h
//  xingzhengbao
//
//  Created by 李爽 on 16/5/5.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BRPlaceholderTextView;
@protocol CustomAlertViewDelegate;

@interface CustomAlertView : UIView
@property (nonatomic, strong) UIView *baseView;
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) NSString *alertTitle;
//@property(nonatomic,strong)UITextField *alertMessage;
@property (nonatomic, strong) NSString *alertMessage;
@property (nonatomic, strong) NSString *cancelTitle;
@property (nonatomic, strong) NSArray *otherTitles;

@property (nonatomic, weak) id<CustomAlertViewDelegate>delegate;
- (id)initCustomAlertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                 cancelButtonTitle:(NSString *)cancelButtonTitle
                 otherButtonTitles:(NSArray *)titles;


- (void)showAlert;

- (void)dismissAlert;
@end

@protocol CustomAlertViewDelegate <NSObject>

- (void)alertView:(CustomAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
