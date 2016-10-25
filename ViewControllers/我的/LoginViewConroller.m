//
//  LoginViewConroller.m
//  PlayInBeiJing
//
//  Created by qianfeng on 2016/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "LoginViewConroller.h"

@interface LoginViewConroller ()
@property (nonatomic , assign) BOOL colorChangeFlag ;
@end

@implementation LoginViewConroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //https://api.108tian.com/mobile/v3/Register?channel=keke&password=2d4d3b885d2762e05a3d296ec7272517&action=login&phoneNumber=12345678901 登录接口
    // 其中的密码是MD5
    [[self navigationController] setNavigationBarHidden: NO] ;
    [self configLoginPageUI] ;
}

- (void) configLoginPageUI {
    [self setColorChangeFlag: YES] ;
    [ToolsX randomColorForTitle: [self navigationController]] ;
    [[self attributeLabel] setAttributedText: [ToolsX createAttributeStr: @"使用其他方式登录"]] ;
    NSArray<UIButton *> * buttons = @[[self loginButton] , [self createUserButton] , [self lostPasswordButton] , [self wbLoginButton] , [self wxLoginButton] , [self qqLoginButton]] ;
    for (int i = 0 ; i < [buttons count] ; i ++) {
        [buttons[i] setTag: i + 300] ;
        [buttons[i] addTarget: self action: @selector(buttonActionSelectorX:) forControlEvents:UIControlEventTouchUpInside] ;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing: YES] ;
    [self setColorChangeFlag: ![self colorChangeFlag]] ;
    [self buttonChangeColor] ;
    if ([self colorChangeFlag] == NO) {
        [[self attributeLabel] setTextColor: CYAN_COLOR] ;
        [[[self navigationController] navigationBar] setTitleTextAttributes: @{NSForegroundColorAttributeName : CYAN_COLOR}] ;
    }
}

- (void) buttonActionSelectorX : (UIButton *) sender {
    [self buttonChangeColor] ;
    [self buttonSwitchActionFun: [sender tag]] ;
}

- (void) buttonSwitchActionFun : (NSInteger) tag{
    switch (tag) {
        case 300 :
        {
            NSLog(@"登录按钮 tag = %ld" , tag) ;
        }
            break ;
        case 301 :
        {
            RegistViewController * regVC = [[RegistViewController alloc] init] ;
            [regVC setTitle: @"注册"] ;
            [regVC setTransferdTag: tag] ;
            [[self navigationController] pushViewController: regVC animated: YES] ;
        }
            break ;
        case 302 :
        {
            RegistViewController * regVC = [[RegistViewController alloc] init] ;
            [regVC setTitle: @"找回密码"] ;
            [regVC setTransferdTag: tag] ;
            [[self navigationController] pushViewController: regVC animated: YES] ;
        }
            break ;
        case 303 :
        {
            NSLog(@"微博登录按钮 tag = %ld" , tag) ;
        }
            break ;
        case 304 :
        {
            NSLog(@"微信登录按钮 tag = %ld" , tag) ;
        }
            break ;
        default:
        {
            NSLog(@"QQ登录按钮 tag = %ld" , tag) ;
        }
            break;
    }
}

- (void) buttonChangeColor {
    NSArray<UIButton *> * buttons = @[[self loginButton] , [self createUserButton] , [self lostPasswordButton]] ;
    UIColor * ranColor = [ToolsX getRandomColor] ;
    for (int j = 0 ; j < [buttons count] ; j ++) {
        if (j == 0) {
            if ([self colorChangeFlag]) {
                [buttons[j] setBackgroundColor: ranColor] ;
            }
            else
            {
                [buttons[j] setBackgroundColor: CYAN_COLOR] ;
            }
        }
        else
        {
            if ([self colorChangeFlag]) {
                [buttons[j] setTitleColor: ranColor forState: UIControlStateNormal] ;
            }
            else
            {
                [buttons[j] setTitleColor: CYAN_COLOR forState: UIControlStateNormal] ;
            }
        }
    }
    if ([self colorChangeFlag] == YES) {
        [[self attributeLabel] setAttributedText: [ToolsX createAttributeStr: @"使用其他方式登录"]] ;
        [ToolsX randomColorForTitle: [self navigationController]] ;
    }
}

@end
