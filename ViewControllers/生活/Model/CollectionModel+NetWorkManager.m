//
//  CollectionModel+NetWorkManager.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "CollectionModel+NetWorkManager.h"

@implementation CollectionModel (NetWorkManager)
+(void)requestCollectionModelData:(void (^)(NSArray *, NSError *))callBack {
    NSString *homeUrl = @"http://shouji.dooshi.com/v43/get_tips_list.php";
    [BaseRequest getWithURL:homeUrl para:nil callBack:^(NSData *data, NSError *error) {
        if (!error) {
            //解析根目录层的字典
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSArray *arr = obj[@"all_name"];
            NSMutableArray *array = [[NSMutableArray alloc]init];
            for (NSDictionary *obj in arr) {
                [array addObject:obj[@"tlogo"]];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(array, nil);
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                callBack(nil, error);
            });
        }
    }];
}
@end





