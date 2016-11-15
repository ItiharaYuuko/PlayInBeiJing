//
//  ShengHuoViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "ShengHuoViewController.h"
#import "CollectionModel+NetWorkManager.h"
#import "SpecialCell.h"
#import "SpecialModel+NetWorkManager.h"
#import "ArtiCell.h"
#import "TableViewModel+NetWorkManager.h"
#import "ArtiViewController.h"
#import "SpecialViewController.h"
//#import "TableViewModel.h"
@interface ShengHuoViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>
@property(nonatomic, strong) NSMutableArray *imageArray; //存放collectionModel数据
@property(nonatomic, strong) NSMutableArray *artiArray; //存放tableView的数组
@property(nonatomic, strong) NSMutableArray *SpecialArray; //存放collectionView的数组
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UIView *headerView;
@property(nonatomic, strong) XTADScrollView *adView;
@property(nonatomic, strong) UICollectionView *collectionView2;
@end
//collectionView1放在headerView上, collectionview
@implementation ShengHuoViewController

-(NSMutableArray *)imageArray{
    if (!_imageArray) {
        _imageArray = [[NSMutableArray alloc]init];
    }
    return _imageArray;
}
-(NSMutableArray *)artiArray{
    if (!_artiArray) {
        _artiArray = [[NSMutableArray alloc]init];
    }
    return _artiArray;
}

-(NSMutableArray *)SpecialArray {
    if (!_SpecialArray) {
        _SpecialArray = [[NSMutableArray alloc]init];
    }
    return _SpecialArray;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H)];
    }
    return  _headerView;
}

-(XTADScrollView *)adView {
    if (!_adView) {
        _adView = [[XTADScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
        [self.headerView addSubview:_adView];
        _adView.infiniteLoop = YES;
        _adView.needPageControl = NO;
        [_adView startAutoCarousel];
//        [_adView setPageControlPositionType:(pageControlPositionType)]
    }
    return _adView;
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H) style:UITableViewStylePlain];
        _tableView.backgroundColor = GRAY_COLOR;
        //注册
        [_tableView registerNib:[UINib nibWithNibName:@"SpecialCell" bundle:nil] forCellReuseIdentifier:@"SpecialCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        _tableView.tableHeaderView = self.headerView;
    }
    return  _tableView;
}
-(UICollectionView *)collectionView2 {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 2;
    if (!_collectionView2) {
        _collectionView2 = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 200, SCREEN_W, SCREEN_H-200) collectionViewLayout:layout];
        _collectionView2.delegate = self;
        _collectionView2.dataSource = self;
        [_collectionView2 registerNib:[UINib nibWithNibName:@"ArtiCell" bundle:nil] forCellWithReuseIdentifier:@"ArtiCell"];
        [self.headerView addSubview:_collectionView2];
        _collectionView2.backgroundColor = [UIColor clearColor];
    }
    return _collectionView2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = false;
    [self loadData];
    [self loadArtiData];
    [self loadSpecialData];
}

-(void)loadSpecialData {
    [HDManager startLoading];
    [SpecialModel getSpecialModelData:^(NSArray *specialArray, NSError *error) {
        if (!error) {
            [self.SpecialArray addObjectsFromArray:specialArray];
//            NSLog(@"121133");
            [self.tableView reloadData];
        }
        [HDManager stopLoading];
    }];
}
-(void)loadArtiData {
    [HDManager startLoading];
    [TableViewModel getTableViewModelData:^(NSArray *array, NSError *error) {
        if (!error) {
            for (int i = 0 ; i < [array count] ; i++) {
                TableViewModel * model = array[i] ;
                if (![model.aiDesc isEqualToString:@""]) {
                    [[self artiArray] addObject:model] ;
                }
            }
            
            [self.collectionView2 reloadData];
        }
        [HDManager stopLoading];
    }];
}
-(void)loadData {
    [HDManager startLoading];
    [CollectionModel requestCollectionModelData:^(NSArray *array, NSError *error) {
        if (error == nil) {
            [self.imageArray addObjectsFromArray:array];
            self.adView.imageURLArray = self.imageArray;
        }
        [HDManager stopLoading]; //结束加载/
    }];
}

#pragma mark - tableView协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [self.SpecialArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialCell" forIndexPath:indexPath];
    SpecialModel *model = _SpecialArray[indexPath.row];
    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:model.images]];
    cell.nameL.text = model.name;
    [cell.likeButton setTitle:model.goods forState:UIControlStateNormal];
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return _headerView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SpecialViewController *SVC = [[SpecialViewController alloc]init];
    SVC.hidesBottomBarWhenPushed = YES;
    SpecialModel *model = self.SpecialArray[indexPath.row];
    SVC.str = model.Id;
    [[self navigationController] pushViewController:SVC animated:YES];
}

#pragma mark - collectionView2 遵从协议;
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.artiArray count];
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TableViewModel *model = self.artiArray[indexPath.item];
    ArtiCell *cell = [_collectionView2 dequeueReusableCellWithReuseIdentifier:@"ArtiCell" forIndexPath:indexPath];
    
    [cell.iconView sd_setImageWithURL:[NSURL URLWithString:model.aiImg]];
    cell.descL.text = model.aiDesc;
    cell.titleL.text = model.aiTitle;
    
    return  cell;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SCREEN_W - 6)/2, 165);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    ArtiViewController *AVC = [[ArtiViewController alloc]init];
    TableViewModel *model = self.artiArray[indexPath.item];
    AVC.str = model.aiMd5;
    AVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:AVC animated:true];
}

@end













