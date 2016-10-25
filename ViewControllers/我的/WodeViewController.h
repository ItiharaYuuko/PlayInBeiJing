//
//  WodeViewController.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/12.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginViewConroller.h" 
#import "SettingsViewController.h" 
@interface WodeViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITableView *mineTableView;
@property (nonatomic , weak) UIView * mineTableViewHeaderView ;
@property (nonatomic , weak) UIImageView * mineHeaderBackgroundImageView ;
@property (nonatomic , weak) UIButton * mineIconButton ;
@property (nonatomic , weak) UILabel * mineNameLabel ;
@property (nonatomic , retain) NSMutableArray * tableViewDataArray ;
@property (nonatomic , weak) UIButton * mineMessageButton ;
@property (nonatomic , weak) UIButton * mineCollectionButton ;
@property (nonatomic , weak) UIButton * mineQRCodeButton ;
@property (nonatomic , weak) UIButton * mineOrderButton ;
@property (nonatomic , assign) BOOL loginFlag ;
@end
