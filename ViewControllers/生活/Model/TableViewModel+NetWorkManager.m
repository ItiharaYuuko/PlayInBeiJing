//
//  TableViewModel+NetWorkManager.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 张琦. All rights reserved.
///http://shouji.dooshi.com/v44/gain_index.php

#import "TableViewModel+NetWorkManager.h"

@implementation TableViewModel (NetWorkManager)

+(void)getTableViewModelData:(void (^)(NSArray *, NSError *))callBack {
    NSString *homeUrl = @"http://shouji.dooshi.com/v44/gain_index.php";
    [BaseRequest getWithURL:homeUrl para:nil callBack:^(NSData *data, NSError *error) {
        if (!error) {
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSArray *arti = obj[@"arti"];
            NSMutableArray *array = [TableViewModel arrayOfModelsFromDictionaries:arti error:nil];
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












