//
//  RightSearchViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "RightSearchViewController.h"
#import "RightSearch2Model+NetWorkManager.h"
#import "RightSearch2TableViewCell.h"
#import "Right3ViewController.h"
@interface RightSearchViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation RightSearchViewController
-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [[NSMutableArray alloc] init];
    
    }
    return  _dataArray;

}
-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 39 - 64) style:UITableViewStylePlain];
        _tableView.rowHeight = 250;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerNib:[UINib nibWithNibName:@"RightSearch2TableViewCell" bundle:nil] forCellReuseIdentifier:@"RightSearch2TableViewCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    [self loadData];
}
-(void)loadData{
    [HDManager startLoading];
    [RightSearch2Model requestData:self.cityId name:self.name callBack:^(NSArray *dataArray, NSError *error) {
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
    return [self.dataArray count];

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RightSearch2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RightSearch2TableViewCell" forIndexPath:indexPath];
    RightSearch2Model *model = self.dataArray[indexPath.row];
    [cell customWith:model];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RightSearch2Model *model = self.dataArray[indexPath.row];
    Right3ViewController *r3VC = [[Right3ViewController alloc] init];
    r3VC.str = model.type;
    r3VC.nameStr = model.name;
   
    r3VC.Id = model.Id;
    
    
    [self.navigationController pushViewController:r3VC animated:YES];
    



}


@end
