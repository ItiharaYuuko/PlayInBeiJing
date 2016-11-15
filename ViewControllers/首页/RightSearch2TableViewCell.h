//
//  RightSearch2TableViewCell.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/19.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RightSearch2Model.h"

@interface RightSearch2TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *typeL;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
-(void)customWith:(RightSearch2Model *)model;
@end
