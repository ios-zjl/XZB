//
//  HomeHotSellTableCell.m
//  LuoLuoBaoMa
//
//  Created by DavyZhang on 16/5/24.
//  Copyright © 2016年 luoluo. All rights reserved.
//

#import "HomeHotSellTableCell.h"
#import "ItemView.h"
#import "HotDetailModel.h"


#define klineViewColor [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.00]
#define kcell_backColor [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00]

#define ktopView_Height 55

@interface HomeHotSellTableCell ()

@property (nonatomic,strong) UILabel *hotNameLabel;
@property (nonatomic,strong) UIView *topView;
@property (nonatomic,strong) UIImageView *bigImageView; // 大图
//@property (nonatomic,strong) 

@end

@implementation HomeHotSellTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = kcell_backColor;
        
        _topView = [[UIView alloc]init];
        _topView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_topView];
        // 热销name
        _hotNameLabel = [[UILabel alloc]init];
        _hotNameLabel.font = [UIFont systemFontOfSize:17.0f];
        _hotNameLabel.textColor = knameLabelColor;
        _hotNameLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_hotNameLabel];
        // 大图
        _bigImageView = [[UIImageView alloc]init];
        _bigImageView.contentMode = UIViewContentModeScaleAspectFill;
        _bigImageView.clipsToBounds = YES;
        [self.contentView addSubview:_bigImageView];
        
        
    }
    return  self;
}

- (void)setModel:(HomeHotCellModel *)model{
    
    _model = model;
    //
    _topView.frame = CGRectMake(0, 10, SCREEN_WIDTH, ktopView_Height);
    _hotNameLabel.text = [NSString stringWithFormat:@"——  %@  ——",model.HotName];
    _hotNameLabel.frame = CGRectMake(0, (_topView.height-20)/2+10, SCREEN_WIDTH, 20);
    _bigImageView.frame = CGRectMake(0, CGRectGetMaxY(_topView.frame)+1, SCREEN_WIDTH/2, SCREEN_WIDTH/2-2);
    _bigImageView.image = [UIImage imageNamed:model.bigImageName];//[UIImage imageNamed:@"listHoderImage"];
    CGFloat itemW = (SCREEN_WIDTH/2-2)/2;
    CGFloat itemH = (SCREEN_WIDTH/2-2)/2;
    NSInteger len = _model.items.count;
    for (int i = 0; i<len; i++) {
        CGFloat itemX = i%2==0?CGRectGetMaxX(_bigImageView.frame)+1:CGRectGetMaxX(_bigImageView.frame)+itemW+2;
        CGFloat itemY = i<2?CGRectGetMaxY(_topView.frame)+1:CGRectGetMaxY(_topView.frame)+itemH+2;
        HotDetailModel *itemModel = _model.items[i];
        ItemView *item = [[ItemView alloc]initWithFrame:CGRectMake(itemX, itemY, itemW, itemH)];
        item.backgroundColor = [UIColor whiteColor];
        [item setImage:itemModel.itemImage nameLabel:[NSString stringWithFormat:@"%@%d",itemModel.itemName,i]];
        [self.contentView addSubview:item];
    }
}
+(CGFloat)CellHeight{

    return  SCREEN_WIDTH/2+ktopView_Height+10;
    
}

+(instancetype)CellWithTable:(UITableView *)tableView reuseId:(NSString *)reuseId{

    HomeHotSellTableCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell==nil) {
        cell = [[HomeHotSellTableCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
    
}

- (void)prepareForReuse{
    [super prepareForReuse];
    
    _model = nil;
    [_hotNameLabel setFrame:CGRectZero];
    [_topView setFrame:CGRectZero];
    [_bigImageView setFrame:CGRectZero];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
