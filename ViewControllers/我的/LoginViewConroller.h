//
//  LoginViewConroller.h
//  PlayInBeiJing
//
//  Created by qianfeng on 2016/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegistViewController.h"
#import "ToolsX.h"
@interface LoginViewConroller : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *loginPhoneNumTF;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *createUserButton;
@property (weak, nonatomic) IBOutlet UIButton *lostPasswordButton;
@property (weak, nonatomic) IBOutlet UILabel *attributeLabel;
@property (weak, nonatomic) IBOutlet UIButton *wbLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *wxLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *qqLoginButton;
@property (weak, nonatomic) IBOutlet UIImageView *pillsImageView;

@end
