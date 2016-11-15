//
//  SearchViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "SearchViewController.h"
#import "ShouyeViewController.h"
#import "LeftButtonViewController.h"

@interface SearchViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation SearchViewController

-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 104, SCREEN_W, SCREEN_H - 64 - 10) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}
-(NSMutableArray *)searchArray{
    if(!_searchArray){
        _searchArray = [[NSMutableArray alloc]init];
        
    }
    return _searchArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = false;
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.searchArray.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"q"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"q"];
    
    }
    cell.textLabel.text = self.searchArray[indexPath.row];
    return cell;

}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return @"搜索结果";

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{



}



@end



















