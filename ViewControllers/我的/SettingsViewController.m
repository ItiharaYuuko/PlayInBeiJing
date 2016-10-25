//
//  SettingsViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 2016/10/15.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController () <UITableViewDelegate , UITableViewDataSource>
@property (nonatomic , assign) BOOL colorChangeFlag ;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self configDataSource] ;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setColorChangeFlag: ![self colorChangeFlag]] ;
    [[self aboutUsTableView] reloadData] ;
    if ([self colorChangeFlag] == NO) {
        [[self logOutBtnX] setBackgroundColor: CYAN_COLOR] ;
        [[[self navigationController] navigationBar] setTitleTextAttributes: @{NSForegroundColorAttributeName : CYAN_COLOR}] ;
    }
}

- (void) configDataSource {
    _dataArrayX = @[@{@"微博" : @"艾利西亚福罗伦斯"} , @{@"微信" : @"524038921"} , @{@"合作邮箱" : @"wert3715@163.com"} , @{@"合作QQ" : @"312567604"} ,@{@"客服电话" : @"400-820-8820"}] ;
    [[self aboutUsTableView] setScrollEnabled: NO] ;
    [[self aboutUsTableView] setSeparatorColor: [ToolsX getRandomColor]] ;
    [[self aboutUsTableView] setAllowsSelection: NO] ;
    [[self navigationController] setNavigationBarHidden: NO] ;
    [self setColorChangeFlag: YES] ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self dataArrayX] count] ;
}
- (IBAction)logoutButtonAction:(UIButton *)sender {
    NSLog(@"button tag = %ld" , [sender tag]) ;
    if ([self colorChangeFlag]) {
        [sender setBackgroundColor: [ToolsX getRandomColor]] ;
        [ToolsX randomColorForTitle: [self navigationController]] ;
    }
    [[self aboutUsTableView] reloadData] ;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: @"ccc"] ;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleValue1 reuseIdentifier: @"ccc"] ;
    }
    NSDictionary * dicXModel = [self dataArrayX][[indexPath row]] ;
    if ([self colorChangeFlag]) {
        NSAttributedString * attTitle = [ToolsX createAttributeStr:[dicXModel allKeys][0]] ;
        NSAttributedString * attDetail = [ToolsX createAttributeStr:[dicXModel allValues][0]] ;
        [[cell textLabel] setAttributedText: attTitle] ;
        [[cell detailTextLabel] setAttributedText: attDetail] ;
    }
    else
    {
        [[cell textLabel] setText: [dicXModel allKeys][0]] ;
        [[cell detailTextLabel] setText: [dicXModel allValues][0]] ;
        [[cell textLabel] setTextColor: [UIColor darkTextColor]] ;
        [[cell detailTextLabel] setTextColor: [UIColor lightGrayColor]] ;
    }
    return cell ;
}

@end
