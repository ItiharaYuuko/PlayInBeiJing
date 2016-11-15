//
//  RightSearchModel+NetWorkManager.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "RightSearchModel+NetWorkManager.h"

@implementation RightSearchModel (NetWorkManager)
+(void)requestRightData:(NSString *)cityId callBack:(void (^)(NSArray *, NSError *))callBack{
    NSString *urlStr = [[NSString alloc] initWithFormat:@"https://api.108tian.com/mobile/v3/Search?action=getHotWordList&cityId=%@",cityId];
    
    [BaseRequest postWithURL:urlStr para:nil callBack:^(NSData *data, NSError *error) {
        if (!error){
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *list = obj[@"data"];
            
            NSMutableArray *dataArray = [RightSearchModel arrayOfModelsFromDictionaries:list error:nil];
            dispatch_sync(dispatch_get_main_queue(), ^{
                callBack(dataArray,nil);
            });
            
            
            
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                callBack(nil,error);
                
            });
            
            
        }
        
    }];
    
}


@end
