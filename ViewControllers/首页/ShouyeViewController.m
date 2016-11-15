//
//  ShouyeViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/12.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "ShouyeViewController.h"
#import "LeftButtonViewController.h"
#import "RightButtonViewController.h"
#import "XTADScrollView.h"
#import "HeaderModel+NetWorkManager.h"
#import "ItemModel+NetWorkManager.h"
#import "CityModel.h"
#import "ItemTableViewCell.h"
#import "SearchViewController.h"
@interface ShouyeViewController ()<UITableViewDelegate,UITableViewDataSource,LeftDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;//存放tableView数据的数组
@property (nonatomic,strong) NSString *cityName;
@property(nonatomic,strong)NSMutableArray *nameArray;
@property(nonatomic,strong)NSMutableArray *subtitleArray;
@property (nonatomic,strong) NSMutableArray *headerArray;//头视图中每张图片ScrollView数据的数组
@property (nonatomic,strong) NSMutableArray *cityArray;//城市数据数组
@property (nonatomic,strong) NSMutableArray *bannerArray;//头视图中ScrollView中的图片数据的数组
@property (nonatomic,strong) XTADScrollView *adView;//添加的scrollView
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *headerView;//tableView的头视图
@property (nonatomic,strong) NSString *page;





@end

@implementation ShouyeViewController
-(void)passValue1:(NSString *)cityName{
    for (CityModel *model in self.cityArray){
        if(model.name == cityName){
            self.cityId = model.Id;
        }
    
    }
    

}


- (void)viewDidLoad {
    [super viewDidLoad];
    //UIViewColltroller 中如果有且只有一个滚动视图时，自动留出Bar视图的空间，当有多个滚动视图时，这个属性自动失效
    self.page = @"0";
    self.cityId = @"1";
    self.automaticallyAdjustsScrollViewInsets = NO;

    
   
    
    
}
-(void)viewWillAppear:(BOOL)animated{
   
    
    
    [self createBtns];
    
    [self loadHeaderData];
    [self loadTableViewCellData];
    
    
}
//-(NSString *)cityId{
//    if(_cityId != nil){
//        _cityId = @"1";
//        
//    }
//    return _cityId;
//}
//设置轮播视图
-(XTADScrollView *)adView{
    if (_adView == nil) {
        _adView = [[XTADScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 150)];
        _adView.needPageControl = YES;
        //轮播方向
        _adView.pageControlPositionType = pageControlPositionTypeRight;
        //是否自动启动轮播
        _adView.infiniteLoop = YES;
        
    }
    return _adView;
}
//设置头视图
-(UIView *)headerView{
    if(_headerView == nil){
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 250)];
        _headerView.backgroundColor = CYAN_COLOR;
        [_headerView addSubview:self.adView];
    }
    return _headerView;
}
-(void)createBtns{
    UIView *btnsView = [[UIView alloc]initWithFrame:CGRectMake(0, 150, SCREEN_W, 90)];
    btnsView.backgroundColor = [UIColor whiteColor];
    NSArray *btnImageStrArr = @[@"home_surrounding@2x",@"home_accommodation@2x",@"home_pick@2x",@"home_activity@2x"];
    NSArray *btnTitleArr = @[@"周边",@"住宿",@"采摘",@"活动"];
    
    for (int i = 0;i < 4;i++){
        CGFloat space = (SCREEN_W - 78 * 4 - 40) / 3;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20 + i * (78 + space), -8, 78, 78);
        //btn.showsTouchWhenHighlighted = true;
        [btnsView addSubview:btn];
        [btn setImage:[[UIImage imageNamed:btnImageStrArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20 + i * (78 + space), 60, 78, 22)];
        label.text = btnTitleArr[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        [btnsView addSubview:label];
        [self.headerView addSubview:btnsView];
        
    }
}
//设置tableView
-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 10) style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        _tableView.tableHeaderView = self.headerView;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 300;
        _tableView.backgroundColor = GRAY_COLOR;
        
        //注册Cell
        [_tableView registerNib:[UINib nibWithNibName:@"ItemTableViewCell" bundle:nil] forCellReuseIdentifier:@"ItemTableViewCell"];
    }
    return _tableView;
}

-(NSMutableArray *)dataArray{
    if(!_dataArray){
        //数据初始化
        _dataArray = [[NSMutableArray alloc]init];
    
    }
    return _dataArray;
}
-(NSMutableArray *)nameArray{
    if(!_nameArray){
        //数据初始化
        _nameArray = [[NSMutableArray alloc]init];
        
    }
    return _nameArray;
}
-(NSMutableArray *)subtitleArray{
    if(!_subtitleArray){
        //数据初始化
        _subtitleArray = [[NSMutableArray alloc]init];
        
    }
    return _subtitleArray;
}
-(NSMutableArray *)headerArray{
    if(!_headerArray){
        //数据初始化
        _headerArray = [[NSMutableArray alloc]init];
        
    }
    return _headerArray;
}
-(NSMutableArray *)bannerArray{
    if(!_bannerArray){
        //数据初始化
        _bannerArray = [[NSMutableArray alloc]init];
        
    }
    return _bannerArray;
}
-(NSMutableArray *)cityArray{
    if(!_cityArray){
        //数据初始化
        _cityArray = [[NSMutableArray alloc]init];
        
    }
    return _cityArray;
}
-(NSString *)cityName{
    if(!_cityName){
        //数据初始化
        _cityName = [[NSString alloc]init];
        
    }
    return _cityName;
}
#pragma mark - 获取网络数据
-(void)loadTableViewCellData{
    [HDManager startLoading];//开始加载
    [ItemModel requestTableViewData:self.cityId page:self.page  callBack:^(NSArray *dataSource, NSArray *nameArray, NSArray *subtitleArray, NSError *error) {
        if(error == nil){
            if(self.nameArray != nil){
                self.nameArray = nil;
            }
            if (self.subtitleArray != nil) {
                self.subtitleArray = nil;
            }
            if (self.dataArray != nil) {
                self.dataArray = nil;
            }
            
            [self.nameArray addObjectsFromArray:nameArray];
            [self.subtitleArray addObjectsFromArray:subtitleArray];
            [self.dataArray addObjectsFromArray:dataSource];
            [self.tableView reloadData];
        }
        [HDManager stopLoading];//结束加载
        
    }];

}
-(void)loadHeaderData{
    [HDManager startLoading];
    [HeaderModel requestCityData:self.cityId callBack:^(NSString *cityName,NSArray *banner, NSArray *bannerImage, NSArray *cityArray, NSError *error) {
        if(error==nil){
            self.cityName = cityName;
            if(self.adView.imageURLArray != nil){
                self.adView.imageURLArray = nil;
            }
            if(self.headerArray != nil){
                self.headerArray = nil;
            }
            if (self.bannerArray != nil) {
                self.bannerArray = nil;
            }
            if (self.cityArray != nil) {
                self.cityArray = nil;
            }
            self.adView.imageURLArray = bannerImage;
            [self.headerArray addObjectsFromArray:banner];
            [self.bannerArray addObjectsFromArray:bannerImage];
            [self.cityArray addObjectsFromArray:cityArray];
            [self CreateNavigationItem];
            [self.tableView reloadData];
        }
    }];
    
}
//创建导航条上的左右按钮
-(void)CreateNavigationItem{
    
    //左按钮
    UIBarButtonItem *leftItem1 = [[UIBarButtonItem alloc]initWithTitle:self.cityName style:UIBarButtonItemStyleDone target:self action:@selector(leftButton)];
    UIImage *leftImage = [[UIImage imageNamed:@"home_city_location_img@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftItem2 = [[UIBarButtonItem alloc]initWithImage:leftImage style:UIBarButtonItemStylePlain target:self action:@selector(leftButton)];
    leftItem2.imageInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItems = @[leftItem1,leftItem2];
    //右按钮
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home_search_img@2x"] style:UIBarButtonItemStyleDone target:self action:@selector(rightButton)];
    self.navigationItem.rightBarButtonItem = rightItem;
}
-(void)leftButton{
    LeftButtonViewController *leftButtonVC = [[LeftButtonViewController alloc]init];
    leftButtonVC.navigationItem.title = self.cityName;
   
    leftButtonVC.cityModelArray = self.cityArray;
    
    leftButtonVC.delegate = self;
    
    [self.navigationController pushViewController:leftButtonVC animated:true];
  
}
-(void)rightButton{
    RightButtonViewController *rightButtonVC = [[RightButtonViewController alloc]init];
    rightButtonVC.cityId = self.cityId;
    [self.navigationController pushViewController:rightButtonVC animated:true];
}
#pragma  mark - UITableView 协议方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  [self.dataArray count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.dataArray[section];
    return  [array count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemTableViewCell" forIndexPath:indexPath];
    ItemModel *model = self.dataArray[indexPath.section][indexPath.row];
   

    NSString *picUrl = [[NSString alloc]initWithFormat:@"%@%@",PICURL,model.img];
    [cell.img sd_setImageWithURL:[NSURL URLWithString:picUrl]];
    cell.nameL.text = model.name;
    cell.smallImg2.image = [UIImage imageNamed:@"list_product_save_tag_img@2x"];
    cell.favL.text = model.recommend.fav;
    if(model.recommend.price){
        cell.smallImg1.image = [UIImage imageNamed:@"list_product_date_tag_img@2x"];
        cell.longL.text = @".12km";
        if(model.recommend.priceRange[0] == model.recommend.priceRange[1]){
            cell.priceOrRange.text = [[NSString alloc]initWithFormat:@"¥%@",model.recommend.price];
            
        }else{
            cell.priceOrRange.text = [[NSString alloc]initWithFormat:@"¥%@~%@",model.recommend.priceRange[0],model.recommend.priceRange[1]];
            
        }
        
    }else{
        cell.smallImg1.image = [UIImage imageNamed:@"common_list_location_img@2x"];
       cell.longL.text = @"12km";
        
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 70;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 70)];
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 35)];
    UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, SCREEN_W, 35)];
    [view addSubview:lable1];
    [view addSubview:lable2];
    lable1.textAlignment = NSTextAlignmentCenter;
    lable2.textAlignment = NSTextAlignmentCenter;
    lable1.text = self.nameArray[section];
    lable2.text = self.subtitleArray[section];
    lable1.backgroundColor = [UIColor whiteColor];
    lable2.backgroundColor = [UIColor whiteColor];
    lable2.font = [UIFont systemFontOfSize:15];
    lable2.textColor = TEXTGRAY_COLOR;
    return view;
}


@end





















