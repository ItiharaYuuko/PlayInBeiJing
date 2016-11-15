//
//  ArtiViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/19.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "ArtiViewController.h"

@interface ArtiViewController ()
@end

@implementation ArtiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSString *string = @"http://www.dooshi.com/app_aview.php?ano=";
    NSString *sss = @"";
    sss = [string stringByAppendingString:self.str];
    
    UIWebView *wbview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H-64)];
    [wbview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:sss]]];
    [self.view addSubview:wbview];
    NSLog(@"%@", string);
}
@end
