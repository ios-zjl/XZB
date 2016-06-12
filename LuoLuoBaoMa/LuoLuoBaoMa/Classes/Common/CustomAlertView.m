//
//  CustomAlertView.m
//  xingzhengbao
//
//  Created by 李爽 on 16/5/5.
//  Copyright © 2016年 XZB. All rights reserved.
//

#import "CustomAlertView.h"
#import "BRPlaceholderTextView.h"
static const int  KTextFieldNameLength = 100;


@interface CustomAlertView ()<UITextViewDelegate>
{
    BRPlaceholderTextView *messageLabel;
}
@end

@implementation CustomAlertView

@synthesize delegate;
@synthesize baseView;
@synthesize contentView;

@synthesize alertTitle;
@synthesize alertMessage;
@synthesize cancelTitle;
@synthesize otherTitles;

- (id)initCustomAlertViewWithTitle:(NSString *)title
                           message:(NSString *)message
                 cancelButtonTitle:(NSString *)cancelButtonTitle
                 otherButtonTitles:(NSArray *)titles
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        self.alertTitle = title;
        self.alertMessage= message;
        self.cancelTitle = cancelButtonTitle;
        self.otherTitles = titles;
        
        CGRect frame = CGRectZero;
        
        self.contentView = [[UIView alloc] init];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.userInteractionEnabled = YES;
        self.contentView.layer.cornerRadius = 4;
        self.contentView.layer.borderColor = kTBL_BACK_COLOR.CGColor;
        self.contentView.layer.borderWidth = 0.5;
        [self addSubview:self.contentView];
        
        float height = 0.0;
        
        CGSize titleSize = CGSizeMake(260.0, 0.0);
        
        if (self.alertTitle) {
            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.backgroundColor = [UIColor clearColor];
            titleLabel.font = [UIFont systemFontOfSize:20.0f];
            titleLabel.textColor = [UIColor blackColor];
            titleLabel.text = self.alertTitle;
            titleLabel.textAlignment = NSTextAlignmentLeft;
            titleLabel.numberOfLines = 0;
            titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            [self.contentView addSubview:titleLabel];
            
            titleSize =  [self.alertTitle sizeWithFont:[UIFont systemFontOfSize:20.0f] constrainedToSize:CGSizeMake(260, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
            titleLabel.frame = CGRectMake(10, 10, 260, titleSize.height);
            
            height = height+titleSize.height+20;
            
//            UIImageView *lineImageView = [[UIImageView alloc] init];
//            lineImageView.frame = CGRectMake(10, titleLabel.frame.origin.y+titleLabel.frame.size.height+10, 260, 0.5);
//            lineImageView.backgroundColor = [UIColor lightGrayColor];
//            [self.contentView addSubview:lineImageView];
        }
        
        CGSize messageSize = CGSizeMake(260.0, 100.0);
        if (self.alertMessage) {
            messageLabel = [[BRPlaceholderTextView alloc] init];
            //=======
            messageLabel = [[BRPlaceholderTextView alloc] initWithFrame:CGRectMake(90, 10, 220, 80)];
            [messageLabel setDelegate:self];
            messageLabel.textColor = kCellTitle_COLOR;
            messageLabel.scrollEnabled = YES;
            messageLabel.font = [UIFont fontWithName:@"Arial" size:17.0f];
            // 判断是迟到还是早退
            if ( [[[NSUserDefaults standardUserDefaults ] objectForKey:@"GoToWork"] isEqualToString:@"上班"])// 上班
            {
                messageLabel.placeholder = @"请说明迟到原因(可选)";
                
            }else if ( [[[NSUserDefaults standardUserDefaults ] objectForKey:@"GoToWork"] isEqualToString:@"下班"])// 下班
            {
                messageLabel.placeholder = @"请说明早退原因(可选)";
                
            }
            
            
            [messageLabel setPlaceholderFont:[UIFont systemFontOfSize:16.0f]];
            //            ptext.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
            messageLabel.layer.borderColor = kCellValue_COLOR.CGColor;
            messageLabel.layer.cornerRadius = 3.0;
            messageLabel.layer.borderWidth = 1;
            //=======
            
            
            messageLabel.backgroundColor = [UIColor clearColor];
            messageLabel.font = [UIFont systemFontOfSize:16.0f];
            messageLabel.textColor = [UIColor blackColor];
            messageLabel.text = self.alertMessage;
//            messageLabel.textAlignment = NSTextAlignmentCenter;
            [self.contentView addSubview:messageLabel];
            
//            messageSize =  [self.alertMessage sizeWithFont:[UIFont systemFontOfSize:20.0f] constrainedToSize:CGSizeMake(260, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
            messageLabel.frame = CGRectMake(10, 10+10+titleSize.height+10, 260, 100);
            
            height = height+messageSize.height+20;
            
            // 下划线可以去掉
//            UIImageView *lineImageView = [[UIImageView alloc] init];
//            lineImageView.frame = CGRectMake(10, messageLabel.frame.origin.y+messageLabel.frame.size.height+10, 260, 0.5);
//            lineImageView.backgroundColor = [UIColor lightGrayColor];
//            [self.contentView addSubview:lineImageView];
        }
        
        
        if ([self.otherTitles count] > 1) {
            height = height + [self.otherTitles count]*44;
        }
        else if([self.otherTitles count] == 1)
        {
            if (cancelButtonTitle) {
                UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
                [cancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                [cancelBtn setTitle:cancelButtonTitle forState:UIControlStateNormal];
                [cancelBtn addTarget:self action:@selector(cancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
                cancelBtn.frame = CGRectMake(3, 20+titleSize.height+messageSize.height+20, 130, 40);
//                cancelBtn.backgroundColor = [UIColor redColor];
                [cancelBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
                cancelBtn.layer.borderColor = kCellValue_COLOR.CGColor;
                cancelBtn.layer.cornerRadius = 3.0;
                cancelBtn.layer.borderWidth = 1;
                [self.contentView addSubview:cancelBtn];
                
//                UIImageView *lineImageView = [[UIImageView alloc] init];
//                lineImageView.frame = CGRectMake(139.5, 20+titleSize.height+messageSize.height+20, 0.5, 55);
//                lineImageView.backgroundColor = [UIColor lightGrayColor];
//                [self.contentView addSubview:lineImageView];
                
                UIButton *otherBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                otherBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
                [otherBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                [otherBtn setTitle:[self.otherTitles objectAtIndex:0] forState:UIControlStateNormal];
                [otherBtn addTarget:self action:@selector(otherBtnAction) forControlEvents:UIControlEventTouchUpInside];
                otherBtn.frame = CGRectMake(145, 20+titleSize.height+messageSize.height+20, 130, 40);
//                otherBtn.backgroundColor = [UIColor redColor];
                [otherBtn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
                otherBtn.layer.borderColor = kCellValue_COLOR.CGColor;
                otherBtn.layer.cornerRadius = 3.0;
                otherBtn.layer.borderWidth = 1;
                [self.contentView addSubview:otherBtn];
            }
            
            height = height+44;
        }
        else
        {
            if (cancelButtonTitle) {
                UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
                cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
                [cancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                [cancelBtn setTitle:cancelButtonTitle forState:UIControlStateNormal];
                [cancelBtn addTarget:self action:@selector(cancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
                cancelBtn.frame = CGRectMake(0, 20+titleSize.height+messageSize.height+20, 280, 44);
                [self.contentView addSubview:cancelBtn];
                height = height+44;
            }
        }
        
        frame.size.height = height;
        frame.size.width = 280;
        
        self.contentView.frame = CGRectMake(0, 0, 280, height);
        self.frame = frame;
    }
    return self;
}

// 取消按钮事件
- (void)cancelBtnAction
{
    [self dismissAlert];
}

// 确定按钮事件
- (void)otherBtnAction
{
    //
    NSInteger buttonIndex = 1;
    CustomAlertView *alertV;
    if ([delegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)])
    {
        [delegate alertView:alertV clickedButtonAtIndex:buttonIndex];
    }
}

- (void)showAlert
{
    self.baseView = [[UIView alloc] init];
    [self.baseView setFrame:[UIScreen mainScreen].bounds];
    [self.baseView setBackgroundColor:[UIColor colorWithRed:0.4 green:0.4 blue:0.4 alpha:0.4]];
    [self.baseView setUserInteractionEnabled:YES];
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self.baseView];
    [window addSubview:self];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    //[self.baseView addGestureRecognizer:tapGesture];
    
    CGRect frame = self.frame;
    frame.origin.x = (self.baseView.frame.size.width-self.frame.size.width)/2;
    frame.origin.y = (self.baseView.frame.size.height-self.frame.size.height)/2;
    self.frame = frame;
    
    self.baseView.alpha = 0.f;
    self.alpha = 0.f;
    self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.transform = CGAffineTransformMakeScale(1.05f, 1.05f);
        self.alpha = 1.f;
        self.baseView.alpha = 1.f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.08f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:nil];
    }];
}

- (void)dismissAlert
{
    [UIView animateWithDuration:0.3f animations:^{
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.alpha = 0.f;
        self.baseView.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self.baseView removeFromSuperview];
    }];
}

- (void)tapGestureAction:(UITapGestureRecognizer *)tap
{
    [self dismissAlert];
}
#pragma mark -
#pragma mark TextView开始编辑就触动
//Add by aggie about "限制字符字数" 2016-05-06 -------start--
- (void)textViewDidChange:(UITextView *)textView
{
    self.alertMessage = messageLabel.text;
    if (textView)
    {
        
        UITextView *textField = textView;
        NSString *toBeString = textField.text;
        UITextRange *selectRange = [textField markedTextRange];
        // 获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectRange.start offset:0];
        if (!position) {
            int strLen = [GlobalHelper getToInt:toBeString];
            if (strLen>KTextFieldNameLength) {
                int len = (int)[toBeString length];
                for (int i=0; i<len; i++) {
                    NSString *formString = [toBeString substringToIndex:i];
                    NSInteger fromStrLen = [GlobalHelper getToInt:formString];
                    if (fromStrLen==KTextFieldNameLength) {
                        textField.text = formString;
                    }
                }
            }else{
                textField.text = toBeString;
            }
        }
        self.alertMessage = textView.text;
        NSLog(@"%@",textView.text);
    }
    
    

}
//Add by aggie about "限制字符字数" 2016-05-06 -------end--
-(void)textViewDidChangeSelection:(UITextView *)textView
{
    self.alertMessage = messageLabel.text;
    
    
}



@end