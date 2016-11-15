//
//  LeftButtonViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "LeftButtonViewController.h"
#import "CityModel.h"
//#import "SearchViewController.h"
#import "Citytitle.h"
#import "SearchViewController.h"


@interface LeftButtonViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating,UISearchBarDelegate>
//@property (nonatomic,strong) NSMutableArray *cityModelArray;
@property (nonatomic,strong) NSMutableArray *bigCharacterArray;
@property (nonatomic,strong) NSMutableArray *cityArray;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) SearchViewController *searchVC;
@property (nonatomic,strong) UISearchController *sc;
@property (nonatomic,strong) NSMutableArray *searchArr;
@property (nonatomic,strong) Citytitle *model;
@property (nonatomic,strong) NSString *cityName;
@end

@implementation LeftButtonViewController
//-(SearchViewController *)searchVC{
//    _searchVC = [[SearchViewController alloc]init];
//
//    return _searchVC;
//}

-(NSMutableArray *)cityModelArray{
    if(!_cityModelArray){
        _cityModelArray = [[NSMutableArray alloc]init];
    }
    return _cityModelArray;
}
-(NSMutableArray *)cityArray{
    if(!_cityArray){
        _cityArray = [[NSMutableArray alloc]init];
    }
    return _cityArray;
}
-(NSMutableArray *)bigCharacterArray{
    if(!_bigCharacterArray){
        _bigCharacterArray = [[NSMutableArray alloc]init];
    }
    return _bigCharacterArray;
}
-(NSMutableArray *)searchArr{
    if(!_searchArr){
        _searchArr = [[NSMutableArray alloc]init];
        
    }
    return _searchArr;
}

-(UISearchController *)sc{
    if(!_sc){
        
        _sc = [[UISearchController alloc]initWithSearchResultsController:self.searchVC];

    }
    return _sc;
}
-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 49) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = false;
    self.searchVC = [[SearchViewController alloc]init];
 
    
    [self jiexi];
    [self.tableView reloadData];
    [self createSearch];
    
    
}
-(void)passValue2:(NSString *)cityName{
    self.cityName = cityName;


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)createSearch{
   
    self.tableView.tableHeaderView = self.sc.searchBar;
    self.sc.searchBar.searchBarStyle = UISearchBarStyleDefault;
    self.sc.hidesNavigationBarDuringPresentation = NO;
    self.sc.dimsBackgroundDuringPresentation = YES;
    self.sc.searchResultsUpdater = self;
}
-(void)jiexi{
    NSMutableArray *arr1 = [NSMutableArray array];
   
    for (CityModel *model in self.cityModelArray){
        NSString *city = model.city;
        char ch = [city characterAtIndex:0];
        NSString *str = [[NSString alloc]initWithFormat:@"%c",ch];
        NSString *STR = str.uppercaseString;
       
        if(![arr1 containsObject:STR]){
            [arr1 addObject:STR];
        }
        for(int i = 0;i < arr1.count;i++){
            for(int j = i + 1;j < arr1.count;j++){
                if ([arr1[i]characterAtIndex:0] > [arr1[j] characterAtIndex:0]){
                    NSString *tmp = arr1[i];
                    arr1[i] = arr1[j];
                    arr1[j] = tmp;
                }
            }
        }
    }
    self.bigCharacterArray = arr1;
    for (NSString *S1 in arr1){
         NSMutableArray *arr2 = [NSMutableArray array];
        for(CityModel *model in self.cityModelArray){
            NSString *city = model.city;
            char ch = [city characterAtIndex:0];
            NSString *str = [[NSString alloc]initWithFormat:@"%c",ch];
            NSString *STR = str.uppercaseString;
            if(S1 == STR){
                [arr2 addObject:model.name];
            }
        }
        [self.cityArray addObject:arr2];
    }
}
#pragma  mark - UITableView 协议方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.bigCharacterArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.cityArray[section];
    
    return array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"qqq"];
    }
    cell.textLabel.text = self.cityArray[indexPath.section][indexPath.row];
    if (self.cityArray[indexPath.section][indexPath.row] == self.cityName){
        cell.selected = YES;
    
    }
    
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.bigCharacterArray[section];

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    for (CityModel * model in self.cityModelArray) {
        if (model.name == self.cityArray[indexPath.section][indexPath.row]){
            [self.delegate passValue1:model.name];
            
            [self.navigationController popViewControllerAnimated:true];
            
        
        }
        
    }


}




//////设置索引条
//-(NSArray <NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    NSMutableArray *tmpArr = [NSMutableArray array];
//    for (NSString *title in self.bigCharacterArray){
//        self.model.title = @"adsadsfdasf";
//        [tmpArr addObject:self.model];
//        
//    }
//    NSLog(@"%@",[tmpArr valueForKey:@"title"]);
//    
//    
//    
//    
//    return [tmpArr valueForKey:@"title"];
//
//}




-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSMutableArray *resultArr = [NSMutableArray array];
    //[self.searchArr removeAllObjects];
    for (NSMutableArray *arr in self.cityArray){
      
        for (NSString *str in arr){
            
            if ([str containsString:self.sc.searchBar.text]){
                [resultArr addObject:str];
               
                [self.searchArr addObject:str];
                
            }
            
        }
    }
    
    [self.searchVC.searchArray removeAllObjects];
    [self.searchVC.searchArray addObjectsFromArray:self.searchArr];
    [self.searchArr removeAllObjects];
    [self.searchVC viewDidLoad];
    
}








@end













