//
//  ItemView.m
//  LuoLuoBaoMa
//
//  Created by DavyZhang on 16/5/24.
//  Copyright © 2016年 luoluo. All rights reserved.
//

#import "ItemView.h"


#define kImageH  100
#define KimageW  60

@interface ItemView ()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *nameLabel;

@end

@implementation ItemView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        // imageView
        _imageView = [[UIImageView alloc]init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.clipsToBounds = YES;
        _imageView.frame = CGRectMake((frame.size.width-KimageW)/2,5, frame.size.height*.7*0.75, frame.size.height*.7);
        [self addSubview:_imageView];
        
        //nameLabel
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:13.0f];
        _nameLabel.textColor = knameLabelColor;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.frame = CGRectMake(0, CGRectGetMaxY(_imageView.frame)+3, frame.size.width, 18);
        [self addSubview:_nameLabel];
        
    }
    return  self;
}

- (void) setImage:(NSString *)image nameLabel:(NSString *)nameText{

    _imageView.image = [UIImage imageNamed:image];
    
    
    _nameLabel.text = nameText;
//    CGSize nameSize = [nameText sizeWithFont:_nameLabel.font maxSize:CGSizeMake(self.width, MAXFLOAT)];
    
    
    
}

@end
