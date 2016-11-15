//
//  ItemModel+NetWorkManager.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "ItemModel+NetWorkManager.h"

@implementation ItemModel (NetWorkManager)
+(void)requestTableViewData:(NSString *)cityId page:(NSString *)page callBack:(void (^)(NSArray *, NSArray *, NSArray *, NSError *))callBack{
    NSString *urlStr = [[NSString alloc] initWithFormat:@"https://api.108tian.com/mobile/v3/RecommendDetailList?step=2&cityId=%@&page=%@",cityId,page];
    [BaseRequest getWithURL:urlStr para:nil callBack:^(NSData *data, NSError *error) {
        if(!error){
            //解析根目录层的字典
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            //解析首页cell的数据
            NSArray *list = obj[@"data"][@"list"];
            NSMutableArray *dataArray = [NSMutableArray array];
            NSMutableArray *nameArray = [NSMutableArray array];
            NSMutableArray *subtitleArray = [NSMutableArray array];
            for (NSDictionary *items in list){
                [nameArray addObject:items[@"name"]];
                [subtitleArray addObject:items[@"subtitle"]];
                NSArray *arr = items[@"items"];
                NSMutableArray *ItemArray = [ItemModel arrayOfModelsFromDictionaries:arr error:nil];
                [dataArray addObject:ItemArray];
                
            }
            //回调block（闭包）
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(dataArray,nameArray,subtitleArray,nil);
                
            });
            
            
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil,nil,nil,error);
            });
            
        }
        
        
        
    }];


}

@end

















