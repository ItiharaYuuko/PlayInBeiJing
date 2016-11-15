//
//  SpecialCell.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "SpecialCell.h"

@implementation SpecialCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.likeButton.layer.cornerRadius = 10;
    self.likeButton.clipsToBounds = YES;
    _likeButton.backgroundColor = TEXTGRAY_COLOR;
    self.isClick = NO;
}


- (IBAction)buttonClicked:(UIButton *)sender {
    _isClick = !_isClick;
    if (_isClick) {
        _likeButton.backgroundColor = [UIColor redColor];
    } else {
        _likeButton.backgroundColor = TEXTGRAY_COLOR;
    }
}
//- (IBAction)buttonClicked:(UIButton *)sender {
//}
@end
