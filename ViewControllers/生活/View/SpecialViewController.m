//
//  SpecialViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/19.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "SpecialViewController.h"

@interface SpecialViewController ()

@end

@implementation SpecialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    NSString *string = @"";
    string = [string stringByAppendingFormat:@"http://www.dooshi.com/item.php?action=special&id=%@", self.str];
    NSLog(@"%@", string);
    UIWebView *view = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64)];
    [view loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:string]]];
    [[self view] addSubview:view];
}

@end
