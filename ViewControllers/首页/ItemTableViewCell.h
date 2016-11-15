//
//  ItemTableViewCell.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;//图片
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UIImageView *smallImg1;
@property (weak, nonatomic) IBOutlet UILabel *longL;
@property (weak, nonatomic) IBOutlet UIImageView *smallImg2;
@property (weak, nonatomic) IBOutlet UILabel *favL;
@property (weak, nonatomic) IBOutlet UILabel *priceOrRange;

@end
