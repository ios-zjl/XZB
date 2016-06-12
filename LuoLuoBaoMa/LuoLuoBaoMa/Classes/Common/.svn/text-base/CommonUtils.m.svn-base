//
//  CommonUtils.m
//  QSHealthCare
//
//  Created by 张金龙 on 16/1/22.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "CommonUtils.h"

#define kdefaultFont [UIFont systemFontOfSize:16.0f]

//无数据时的文字颜色
#define kNoDataTitleColor      kColor(160,160,160,1)
#define kBackGrayColor         kColor(221,221,221,1)


@implementation CommonUtils

+(UILabel *)createLabelWithText:(NSString *)text frame:(CGRect)frame{
    
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.text = text;
    label.font = kdefaultFont;
    label.textAlignment = NSTextAlignmentLeft;
    
    return label;
}

+(UITextField *)createTextFieldWithText:(NSString *)text placeHolder:(NSString *)holder frame:(CGRect)frame{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder=holder;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.font = kdefaultFont;
    textField.text = text;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    return textField;
    
}
+(UITextView *)createTextViewWithText:(NSString *)text frame:(CGRect)frame{
    
    UITextView *textView = [[UITextView alloc]initWithFrame:frame];
    textView.returnKeyType = UIReturnKeyDefault; // UIReturnKeyDone;
    textView.layer.borderColor =[UIColor blackColor].CGColor;
    textView.layer.borderWidth = 0.3;
    textView.textColor = [UIColor blackColor];
    textView.font = kdefaultFont;
    textView.backgroundColor = [UIColor whiteColor];
    textView.layer.cornerRadius = 2.5;
    textView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin  | UIViewAutoresizingFlexibleWidth;
    return textView;
    
}
+(UIButton *)createButtonWithText:(NSString *)text frame:(CGRect)frame{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:text forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    return button;
    
}
+ (UIButton *)createButtonWithText:(NSString *)text AndImageName:(NSString *)imageName frame:(CGRect)frame{

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:text forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    return button;
    
}

#pragma mark -
#pragma mark 创建返回键
+ (UIButton *)creatBackButton
{
    UIImage * image = [UIImage imageNamed:@"buttonBack"];
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, image.size.width/3, image.size.height/3)];
    [button setImage:image forState:UIControlStateNormal];
    return button;
}

#pragma mark -
#pragma mark 创建返回键
+ (void)createNavigationLeftBarButtonItemWithCustomView:(UIButton *)myButton andNavItem:(UINavigationItem *)item
{
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:myButton];
    if ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7) {
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSpacer.width = -5;
        item.leftBarButtonItems = @[negativeSpacer, buttonItem];
    }else{
        item.leftBarButtonItem = buttonItem;
    }
}



//+(UITextField *)createTextFieldWithText:(NSString *)text frame:(CGRect)frame{
//    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
//    textField
//    return nil;
//}


@end
