//
//  RightSearch2TableViewCell.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/19.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "RightSearch2TableViewCell.h"

@implementation RightSearch2TableViewCell
-(void)customWith:(RightSearch2Model *)model{
    [_headImg sd_setImageWithURL:[[NSURL alloc] initWithString:[[NSString alloc] initWithFormat:@"%@%@",PICURL,model.headImg]]];
    if ([model.type isEqual: @"scene"]){
        _typeL.text = @"景点";
    
    }else if([model.type isEqual:@"event"]){
        _typeL.text = @"活动";
    
    }else if([model.type isEqual:@"weekly"]){
        _typeL.text = @"攻略";
    }else{
    
    }
    _typeL.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:0.3];
    _typeL.textColor = [UIColor whiteColor];
    _nameL.text = model.name;
    
    


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
