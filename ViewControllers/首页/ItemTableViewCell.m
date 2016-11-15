//
//  ItemTableViewCell.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "ItemTableViewCell.h"
#import "ItemModel.h"

@implementation ItemTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _longL.font = [UIFont systemFontOfSize:15];
    _longL.textColor = TEXTGRAY_COLOR;
    _nameL.font = [UIFont systemFontOfSize:15];
    _favL.font = [UIFont systemFontOfSize:15];
    _favL.textColor = TEXTGRAY_COLOR;
    _priceOrRange.textColor = [UIColor redColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
