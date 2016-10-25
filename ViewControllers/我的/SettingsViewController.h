//
//  SettingsViewController.h
//  PlayInBeiJing
//
//  Created by qianfeng on 2016/10/15.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolsX.h" 
@interface SettingsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *versionLibelX;
@property (weak, nonatomic) IBOutlet UITableView *aboutUsTableView;
@property (weak, nonatomic) IBOutlet UIButton *logOutBtnX;
@property (retain , nonatomic) NSArray * dataArrayX ;
@end
