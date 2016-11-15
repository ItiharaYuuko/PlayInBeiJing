//
//  Right3ViewController.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/19.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "Right3ViewController.h"
#import "Right3Model+NetWorkManager.h"
#import "XTADScrollView.h"

@interface Right3ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *banner;
@property (nonatomic,strong) NSMutableArray *sectionArr;
@property (nonatomic,strong) NSMutableDictionary *dict;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *keyArr;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) XTADScrollView *scrollView;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIView *cellView;
@property (nonatomic,strong) UILabel *label;

@end

@implementation Right3ViewController
-(UILabel *)label{
    if(!_label){
        CGFloat height = 0;
        NSString *textStr = [[NSString alloc] initWithFormat:@"%@",self.dict[@"tickets"]];

        NSMutableDictionary * dict =  [NSMutableDictionary dictionary];
        dict[NSFontAttributeName] = [UIFont systemFontOfSize:17];
        CGRect rect = [textStr boundingRectWithSize:CGSizeMake(SCREEN_W, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
        height = rect.size.height;
       
        
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, height)];
        _label.textColor = TEXTGRAY_COLOR;
        _label.numberOfLines = 0;
         _label.text = textStr;
    
    }
    return _label;

}
-(NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [[NSMutableArray alloc] init];
        
    }
    return _dataArray;
}
-(NSMutableArray *)keyArr{
    if(!_keyArr){
        _keyArr = [[NSMutableArray alloc] init];
        
    }
    return _keyArr;
}
-(UILabel *)nameLabel{
    if(!_nameLabel){
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, SCREEN_W, 50)];
        _nameLabel.text = self.nameStr;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.backgroundColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont boldSystemFontOfSize:20];
        
    }
    return _nameLabel;
}
-(NSMutableArray *)sectionArr{
    if(!_sectionArr){
        _sectionArr = [[NSMutableArray alloc] init];
    
    }
    return _sectionArr;

}
-(NSMutableDictionary *)dict{
    if(!_dict){
        _dict = [[NSMutableDictionary alloc] init];
    }
    return _dict;

}
-(XTADScrollView *)scrollView{
    if(!_scrollView){
        
        _scrollView = [[XTADScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 200)];
        _scrollView.needPageControl = YES;
        //轮播方向
        _scrollView.pageControlPositionType = pageControlPositionTypeRight;
        //是否自动启动轮播
        _scrollView.infiniteLoop = YES;
        
    }
    return _scrollView;
    
}

-(UIView *)headerView{
    if(!_headerView){
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, 250)];
        _headerView.backgroundColor = [UIColor redColor];
        
        [_headerView addSubview:self.scrollView];
        [_headerView addSubview:self.nameLabel];
    }
    
    return _headerView;
}


-(UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H - 64 - 40) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.tableHeaderView = self.headerView;
        _tableView.delegate = self;
        _tableView.dataSource =self;
        
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

-(UIView *)cellView{
    CGFloat cellHeight = 0;
    
    
    for (int i = 0; i < self.dataArray.count; i++) {
        UILabel *label = [[UILabel alloc] init];
         UILabel *label1 = [[UILabel alloc] init];
        if([self.keyArr[i]  isEqual: @"subtitle"]){
            NSString *str1 = self.dataArray[i];
            NSMutableDictionary * dict =  [NSMutableDictionary dictionary];
            dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
            CGRect rect = [str1 boundingRectWithSize:CGSizeMake(SCREEN_W, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
            CGFloat height = rect.size.height;
            label1.frame = CGRectMake(0, cellHeight, SCREEN_W, height);
            cellHeight += height;
            label1.backgroundColor  = [UIColor whiteColor];
            label1.textColor = TEXTGRAY_COLOR;
            label1.text = self.dataArray[i];
            label1.font = [UIFont systemFontOfSize:20];
            label1.numberOfLines = 0;
            
            label1.textAlignment = NSTextAlignmentCenter;
            
            
            [_cellView addSubview:label1];
            
        
        
        }else if([self.keyArr[i]  isEqual: @"text"]){
            NSString *str = self.dataArray[i];
            NSMutableDictionary * dict =  [NSMutableDictionary dictionary];
            dict[NSFontAttributeName] = [UIFont systemFontOfSize:17];
            CGRect rect = [str boundingRectWithSize:CGSizeMake(SCREEN_W, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
            
            CGFloat height = rect.size.height;
            label.frame = CGRectMake(0, cellHeight, SCREEN_W, height);
            cellHeight += height;
            label.backgroundColor  = [UIColor whiteColor];
            label.textColor = TEXTGRAY_COLOR;
            label.text = self.dataArray[i];
            label.numberOfLines = 0;
    
            [_cellView addSubview:label];
          
            
        }else if([self.keyArr[i]  isEqual: @"img"]){
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, cellHeight, SCREEN_W, 190)];
            [imageView sd_setImageWithURL:[[NSURL alloc] initWithString:self.dataArray[i]]];
            [_cellView addSubview:imageView];
            cellHeight += 200;
            
            
        }
        
    }

    if(!_cellView){
        _cellView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_W, cellHeight)];
        _cellView.backgroundColor = [UIColor whiteColor];
    }
    

    

    return _cellView;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self loadData];
    
}
-(void)loadData{
    [HDManager startLoading];
    [Right3Model requestData:self.str Id:self.Id callBack:^(NSArray *banner,NSArray *sectionStr,NSDictionary *dict,NSArray *dataArray,NSArray *keyArr, NSError *error) {
        if (error == nil){
            self.scrollView.imageURLArray = banner;
            [self.sectionArr addObjectsFromArray:sectionStr];
            [self.dict addEntriesFromDictionary:dict];
            [self.dataArray addObjectsFromArray:dataArray];
            [self.keyArr addObjectsFromArray:keyArr];
            [self.tableView reloadData];

        }
        [HDManager stopLoading];
    }];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.sectionArr count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qq"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"qq"];
    }
    if(indexPath.section == 0){
        cell.textLabel.text = [[NSString alloc] initWithFormat:@"开放时间:  旺季:%@   淡季:%@",self.dict[@"peakSeason"],self.dict[@"lowSeason"]];
        cell.textLabel.textColor = TEXTGRAY_COLOR;
        
        cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"最佳季节:%@",self.dict[@"suggestTime"]];
        cell.detailTextLabel.numberOfLines = 0;
        
        cell.detailTextLabel.font = [UIFont systemFontOfSize:17];
        cell.detailTextLabel.textColor = TEXTGRAY_COLOR;
        

    }else if (indexPath.section == 1){
//        NSString *textStr = [[NSString alloc] initWithFormat:@"%@",self.dict[@"tickets"]];
//        
//        
//        
//        NSMutableDictionary * dict =  [NSMutableDictionary dictionary];
//        dict[NSFontAttributeName] = [UIFont systemFontOfSize:17];
//        CGRect rect = [textStr boundingRectWithSize:CGSizeMake(SCREEN_W, 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
//        cell.textLabel.text = textStr;
//        cell.textLabel.textColor = TEXTGRAY_COLOR;
//        cell.textLabel.numberOfLines = 0;
       [cell.contentView addSubview:self.label];
    }else if(indexPath.section == 2){
        [cell.contentView addSubview:self.cellView];
        
    
    }
   

    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 100;
    }else if (indexPath.section == 1){
        return self.label.frame.size.height;
    }
    return self.cellView.frame.size.height;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_W, 50)];
    label.text = self.sectionArr[section];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:19];
    return label;
}





@end
