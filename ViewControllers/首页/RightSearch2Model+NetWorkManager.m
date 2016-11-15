//
//  RightSearch2Model+NetWorkManager.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "RightSearch2Model+NetWorkManager.h"

@implementation RightSearch2Model (NetWorkManager)
+(void)requestData:(NSString *)cityId name:(NSString *)name callBack:(void (^)(NSArray *, NSError *))callBack{
    
    
    NSString *url = [[NSString alloc] initWithFormat:@"https://api.108tian.com/mobile/v3/Search?keyword=%@&cityId=%@",name,cityId];
//    NSLog(@"%@",urlStr);
     //NSString *url =@"https://api.108tian.com/mobile/v3/Search?keyword=%E7%8E%AB%E7%91%B0%E6%B5%B7%E5%B2%B8&cityId=1";
    NSString *urlStr = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
   
    
    [BaseRequest getWithURL:urlStr para:nil callBack:^(NSData *data, NSError *error) {
        if (error == nil){
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *list = obj[@"data"][@"list"];
            NSMutableArray *dataArray = [RightSearch2Model arrayOfModelsFromDictionaries:list error:nil];
            
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
