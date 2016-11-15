//
//  RightButtonViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "RightButtonViewController.h"
#import "RightSearchModel+NetWorkManager.h"
#import "RightSearchViewController.h"

@interface RightButtonViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation RightButtonViewController
-(UITableView *)tableView{
    
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49) style:(UITableViewStylePlain)];
        _tableView.rowHeight = 60;
        _tableView.sectionHeaderHeight = 80;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 80)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"热门搜索";
        label.textColor = [UIColor redColor];
        label.font = [UIFont systemFontOfSize:30];
        _tableView.tableHeaderView = label;
        
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}
-(NSMutableArray *)dataArray{
    if(!_dataArray)
    {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadData];
}
-(void)loadData{
    [HDManager startLoading];
    [RightSearchModel requestRightData:self.cityId callBack:^(NSArray *dataArray, NSError *error) {
        if (error == nil){
            [self.dataArray addObjectsFromArray:dataArray];
            [self.tableView reloadData];
            
        }
        [HDManager stopLoading];

        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qq"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"qq"];
    }
    RightSearchModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.word;
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    [cell textLabel].textAlignment = NSTextAlignmentCenter;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RightSearchViewController *rsvc = [[RightSearchViewController alloc] init];
    RightSearchModel *model = self.dataArray[indexPath.row];
    rsvc.navigationItem.title = model.word;
    rsvc.name = model.word;
    rsvc.cityId = self.cityId;
    
    [self.navigationController pushViewController:rsvc animated:YES];
    

}





@end
