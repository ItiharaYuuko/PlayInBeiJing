//
//  HomeViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/12.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "HomeViewController.h"
#import "ShouyeViewController.h"
#import "FaxianViewController.h"
#import "HuodongViewController.h"
#import "WodeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewControllers];
}

-(void)createViewControllers {
    
    ShouyeViewController *shouye = [[ShouyeViewController alloc]init];
    FaxianViewController *faxian = [[FaxianViewController alloc]init];
    HuodongViewController *huodong = [[HuodongViewController alloc]init];
    WodeViewController *wode = [[WodeViewController alloc]init];
    
    NSArray *array = @[shouye,faxian,huodong,wode];
    NSArray *titleArray = @[@"首页",@"发现",@"活动",@"我的"];
    NSArray *titleA = @[@"home@2x",@"choiceness@2x",@"active@2x",@"mine@2x"];
    NSArray *titleB = @[@"home_h@2x",@"choiceness_h@2x",@"active_h@2x",@"mine_h@2x"];
    NSMutableArray *ViewControllers = [NSMutableArray array];
    
    NSInteger i = 0;
    for (BaseViewController *vc in array) {
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
        UIImage *image = [[UIImage imageNamed:titleA[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *imageS = [[UIImage imageNamed:titleB[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:titleArray[i] image:image selectedImage:imageS];
    //    tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, 0, -8);

        [tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:TEXTGRAY_COLOR} forState:UIControlStateNormal];
        [tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:CYAN_COLOR} forState:UIControlStateHighlighted];
        nav.tabBarItem = tabBarItem;
        [ViewControllers addObject:nav];
        i++;
        
    }
    self.viewControllers = ViewControllers;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
