//
//  RegistViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 2016/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()

@property (nonatomic , weak) NSTimer * timerX ;
@property (nonatomic , assign) NSInteger timeXN ;
@property (nonatomic , assign) BOOL colorChangeFlag ;
@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setColorChangeFlag: YES] ;
    NSLog(@"transfered ID =  %ld" , [self transferdTag]) ;
    [ToolsX randomColorForTitle: [self navigationController]] ;
    [self addButtonTarget] ;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing: YES] ;
    [self setColorChangeFlag: ![self colorChangeFlag]] ;
    [self configButtonsBackColor] ;
    if ([self colorChangeFlag] == NO) {
        [[[self navigationController] navigationBar] setTitleTextAttributes: @{NSForegroundColorAttributeName : CYAN_COLOR}] ;
    }
}

- (void) addButtonTarget {
    NSArray <UIButton *> * buttons = @[[self getCNButton] , [self nextStepButton]] ;
    for (int k = 0 ; k < [buttons count] ; k ++) {
        [buttons[k] addTarget: self action: @selector(buttonsActionY:) forControlEvents: UIControlEventTouchUpInside] ;
    }
}

- (void) buttonsActionY : (UIButton *) sender {
    [self configButtonsBackColor] ;
    switch ([sender tag]) {
        case 350 :
        {
            if ([ToolsX stringPredict: [[self phoneNumTF] text] predictRang: @"^[0-9]*$"]) {
                if ([[[self phoneNumTF] text] length] != 11) {
                    [self presentViewController:[ToolsX createAlertWindow: @"警告" alertMessage: @"请输入11位手机号。" actionTitle: @"确定" actionResponse: NULL] animated:YES completion:NULL] ;
                }
                else
                {
                    [[[self navigationController] navigationBar] setHidden: YES] ;
                    [self requestRegistData:[[self phoneNumTF] text]] ;
                    [sender setEnabled: NO] ;
                    [self setTimeXN: 60] ;
                    [self setTimerX: [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeRun) userInfo:nil repeats:true]] ;
                    [[self timerX] fire] ;
                }
            }
            else
            {
                [self presentViewController:[ToolsX createAlertWindow: @"警告" alertMessage: @"请输入正确的手机号。" actionTitle: @"确定" actionResponse: NULL] animated:YES completion:NULL] ;
            }
        }
            break;
            
        default:
        {
            if ([ToolsX stringPredict: [[self checkNumTF] text] predictRang: @"^[0-9]*$"]) {
                if ([[[self checkNumTF] text] length] != 4) {
                    [self presentViewController:[ToolsX createAlertWindow: @"警告" alertMessage: @"请输入4位验证码." actionTitle: @"确定" actionResponse: NULL] animated:YES completion:NULL] ;
                }
                else
                {
                    [self requestNextStepData: [[self phoneNumTF] text] checkNumberInsert: [[self checkNumTF] text]] ;
                }
            }
            else
            {
                [self presentViewController:[ToolsX createAlertWindow: @"警告" alertMessage: @"请输入格式正确的验证码。" actionTitle: @"确定" actionResponse: NULL] animated:YES completion:NULL] ;
            }
        }
            break;
    }
}

- (NSString *) returnRegistRequestURLStr : (NSString *) phoneNumber {
    if ([self transferdTag] == 301) {
        NSString * urlStr = [[NSString alloc] initWithFormat: @"https://api.108tian.com/mobile/v3/Register?action=sendVerifyCodeRegister&phoneNumber=%@" , phoneNumber] ;
        return urlStr ;
    }
    else
    {
        NSString * urlStr = [[NSString alloc] initWithFormat: @"https://api.108tian.com/mobile/v3/Register?action=sendVerifyCodePasswordReset&phoneNumber=%@" , phoneNumber] ;
        return urlStr ;
    }
}

- (void) requestRegistData : (NSString *) phoneNumber {
    AFHTTPSessionManager * shareManager = [ToolsX netWorkManager] ;
    [shareManager GET: [self returnRegistRequestURLStr: phoneNumber] parameters: NULL progress: NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * obj = [NSJSONSerialization JSONObjectWithData: responseObject options:NSJSONReadingMutableContainers error:NULL] ;
        for (int m = 0 ; m < [[obj allKeys] count] ; m ++) {
            NSString * key = [obj allKeys][m] ;
            NSString * value = [obj valueForKey: key] ;
            if ([key isEqualToString: @"msg"]) {
                [self presentViewController: [ToolsX createAlertWindow: @"警告" alertMessage: value actionTitle: @"确定" actionResponse:NULL] animated: YES completion:NULL] ;
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@" , error) ;
    }] ;
}

- (NSString *) returnResetPasswordRequestURLStr : (NSString *) phoneNumber checkNumberInsert : (NSString *) checkNum {
    if ([self transferdTag] == 301) {
        NSString * urlStr = [[NSString alloc] initWithFormat: @"https://api.108tian.com/mobile/v3/Register?action=verifyCodeRegister&code=%@&phoneNumber=%@" , checkNum , phoneNumber] ;
        return urlStr ;
    }
    else
    {
        NSString * urlStr = [[NSString alloc] initWithFormat: @"https://api.108tian.com/mobile/v3/Register?action=verifyCodePasswordReset&code=%@&phoneNumber=%@" , checkNum , phoneNumber] ;
        return urlStr ;
    }
}

- (void) requestNextStepData : (NSString *) phoneNumber checkNumberInsert : (NSString *) checkNum {
    AFHTTPSessionManager * shareManager = [ToolsX netWorkManager] ;
    [shareManager GET: [self returnResetPasswordRequestURLStr: phoneNumber checkNumberInsert: checkNum] parameters: NULL progress: NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * obj = [NSJSONSerialization JSONObjectWithData: responseObject options:NSJSONReadingMutableContainers error:NULL] ;
        for (int m = 0 ; m < [[obj allKeys] count] ; m ++) {
            NSString * key = [obj allKeys][m] ;
            NSString * value = [obj valueForKey: key] ;
            if ([key isEqualToString: @"msg"]) {
                [self presentViewController: [ToolsX createAlertWindow: @"警告" alertMessage: value actionTitle: @"确定" actionResponse:NULL] animated: YES completion:NULL] ;
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@" , error) ;
    }] ;
}

- (void) configButtonsBackColor {
    NSArray <UIButton *> * buttons = @[[self getCNButton] , [self nextStepButton]] ;
    UIColor * ranColor = [ToolsX getRandomColor] ;
    for (int l = 0 ; l < [buttons count] ; l ++) {
        if ([self colorChangeFlag]) {
            [buttons[l] setBackgroundColor: ranColor] ;
            [ToolsX randomColorForTitle: [self navigationController]] ;
        }
        else
        {
            [buttons[l] setBackgroundColor: CYAN_COLOR] ;
        }
    }
}

- (void) timeRun {
    self.timeXN -= 1 ;
    [self timeProcesser: [self getCNButton] timeLimite: [self timeXN] timerL: [self timerX]] ;
}

- (void) timeProcesser : (UIButton *) sender timeLimite : (NSInteger) time timerL : (NSTimer *) timer {
    if (time == 0) {
        [[[self navigationController] navigationBar] setHidden: NO] ;
        [sender setEnabled: YES] ;
        [sender setTitle: @"重发验证码" forState: UIControlStateNormal] ;
        [timer invalidate] ;
    }
    else
    {
        NSString * title = [[NSString alloc] initWithFormat: @"请稍后(%ld)" , time] ;
        [sender setTitle:title forState:UIControlStateDisabled] ;
    }
}

@end
