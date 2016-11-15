//
//  SpecialCell.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (nonatomic, assign) BOOL isClick;
- (IBAction)buttonClicked:(UIButton *)sender;

@end
