//
//  WodeViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/12.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "WodeViewController.h"

@interface WodeViewController () <UITableViewDelegate , UITableViewDataSource>

@end

@implementation WodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self navigationController] setNavigationBarHidden: YES] ;
    _tableViewDataArray = [[NSMutableArray alloc] init] ;
    [self configMineTableView] ;
}

- (void) viewWillAppear:(BOOL)animated {
    [[self navigationController] setNavigationBarHidden: YES] ;
}

- (UIView *) customMineTableViewHeaderView {
        NSArray * nibArr = [[NSBundle mainBundle] loadNibNamed: @"MineTableViewHeaderView" owner: self options:nil] ;
        UIView * MineTableViewHeaderView = [nibArr objectAtIndex: 0] ;
//        [MineTableViewHeaderView setFrame: CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width , 250)] ;
        NSArray * subViews = [MineTableViewHeaderView subviews] ;
        for (int i = 0 ; i < [subViews count] ; i ++) {
            if ([subViews[i] tag] == 411) {
                [subViews[i] setImage: [UIImage imageNamed: @"1.jpg"]] ;
                _mineHeaderBackgroundImageView = subViews[i] ;
            }
            else if ([subViews[i] tag] == 412) {
                [subViews[i] setImage: [[UIImage imageNamed: @"default_touxiang"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal] ;
                [self setupCornerRadiusForView: subViews[i] cornerRadius: [subViews[i] bounds].size.height / 2 borderColor: NULL borderWidth: 0] ;
                [subViews[i] addTarget: self action: @selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside] ;
                _mineIconButton = subViews[i] ;
            }
            else if ([subViews[i] tag] == 413)
            {
                _mineNameLabel = subViews[i] ;
            }
            else if ([subViews[i] tag] == 414)
            {
                [subViews[i] addTarget: self action: @selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside] ;
                [self setupCornerRadiusForView: subViews[i] cornerRadius:5 borderColor: [UIColor groupTableViewBackgroundColor] borderWidth: 1] ;
                _mineMessageButton = subViews[i] ;
            }
            else if ([subViews[i] tag] == 415)
            {
                [subViews[i] addTarget: self action: @selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside] ;
                [self setupCornerRadiusForView: subViews[i] cornerRadius:5 borderColor: [UIColor groupTableViewBackgroundColor] borderWidth: 1] ;
                _mineCollectionButton = subViews[i] ;
            }
            else if ([subViews[i] tag] == 416)
            {
                [subViews[i] addTarget: self action: @selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside] ;
                [self setupCornerRadiusForView: subViews[i] cornerRadius:5 borderColor: [UIColor groupTableViewBackgroundColor] borderWidth: 1] ;
                _mineOrderButton = subViews[i] ;
            }
            else if ([subViews[i] tag] == 417)
            {
                [subViews[i] addTarget: self action: @selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside] ;
                [self setupCornerRadiusForView: subViews[i] cornerRadius:5 borderColor: [UIColor groupTableViewBackgroundColor] borderWidth: 1] ;
                _mineOrderButton = subViews[i] ;
            }
        }
        _mineTableViewHeaderView = MineTableViewHeaderView ;
    return _mineTableViewHeaderView ;
}

- (void) setupCornerRadiusForView : (UIView *) view cornerRadius : (CGFloat) radius  borderColor : (UIColor * _Nullable) color borderWidth : (CGFloat) width {
    [[view layer] setCornerRadius: radius] ;
    [[view layer] setMasksToBounds: YES] ;
    if ((color != nil) && (width != 0)) {
        [[view layer] setBorderWidth: width] ;
        [[view layer] setBorderColor: [color CGColor]] ;
    }
}

- (void) configMineTableView {
    [[self mineTableView] setDelegate: self] ;
    [[self mineTableView] setDataSource: self] ;
    [[self mineTableView] setSeparatorColor: [UIColor clearColor]] ;
    [[self mineTableView] setTableHeaderView: [self customMineTableViewHeaderView]] ;
    NSArray * aaa = @[@"优惠券" , @"积分" , @"设置"] ;
    [[self mineTableView] setRowHeight: 50] ;
    [[self tableViewDataArray] addObjectsFromArray: aaa] ;
}

- (void) loginButtonAction : (UIButton *) sender {
    if ([self loginFlag]) {
        NSLog(@"button tag = %ld true" , [sender tag]) ;
    }
    else
    {
        NSLog(@"button tag = %ld false" , [sender tag]) ;
        [self pushLoginPage] ;
    }
}

- (void) pushLoginPage {
    LoginViewConroller * loginVC = [[LoginViewConroller alloc] init] ;
    [loginVC setTitle: @"登录"] ;
    [loginVC setHidesBottomBarWhenPushed: YES] ;
    [[self navigationController] pushViewController: loginVC animated: YES] ;
}

- (void) pushSettingPage {
    SettingsViewController * setVC = [[SettingsViewController alloc] init] ;
    [setVC setTitle: @"设置"] ;
    [setVC setHidesBottomBarWhenPushed: YES] ;
    [[self navigationController] pushViewController: setVC animated:YES] ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self tableViewDataArray] count] ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: @"111"] ;
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle : UITableViewCellStyleValue1 reuseIdentifier: @"111"] ;
    }
    NSString * text = [self tableViewDataArray][[indexPath row]] ;
    [[cell textLabel] setText: text] ;
    [[cell detailTextLabel] setText: @">"] ;
    if ([indexPath row] != 3) {
        [[cell imageView] setImage: [UIImage imageNamed: @"personal_home_youhuiquan"]] ;
    }
    else
    {
        [[cell imageView] setImage: [UIImage imageNamed: @"personal_home_shezhi"]] ;
    }
    return cell ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath : indexPath animated : YES] ;
    if ([self loginFlag]) {
        NSLog(@"%@" , [self tableViewDataArray][[indexPath row]]) ;
    }
    else
    {
        if([indexPath row] != 2) {
            [self pushLoginPage] ;
        }
        else
        {
            [self pushSettingPage] ;
        }
    }
}

@end
