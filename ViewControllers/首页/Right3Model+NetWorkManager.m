//
//  Right3Model+NetWorkManager.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "Right3Model+NetWorkManager.h"

@implementation Right3Model (NetWorkManager)
+(void)requestData:(NSString *)str Id:(NSString *)Id callBack:(void (^)(NSArray *,NSArray *,NSDictionary *, NSArray *,NSArray *, NSError *))callBack{
    NSString *Str = [[NSString alloc] init];
    if([str  isEqual: @"scene"]){
        //景点
        Str = @"Scene";
        
    }else if ([str  isEqual: @"event"]){
        //活动
        Str = @"Event";
    }else if ([str  isEqual: @"weekly"]){
        //攻略
        Str = @"Weekly";
    }
    NSString *urlStr = [[NSString alloc] initWithFormat:@"https://api.108tian.com/mobile/v3/%@Detail?id=%@&uuid=51135ec5600ce20a66782d7cfb1544d677b114c0",Str,Id];
    [BaseRequest getWithURL:urlStr para:nil callBack:^(NSData *data, NSError *error) {
        if(error == nil){
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSMutableArray *banner = [NSMutableArray array];
            NSMutableArray *dataArray = [NSMutableArray array];
            NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
            NSMutableArray *sectionStr = [NSMutableArray array];
            NSMutableArray *keyArr = [NSMutableArray array];
            if ([str  isEqual: @"scene"]){
                NSArray *sectionArr = @[@"商家信息",@"优惠信息",@"特色看点"];
                [sectionStr addObjectsFromArray:sectionArr];
                NSArray *alblums = obj[@"data"][@"albums"];
                NSArray *urls = alblums[0][@"urls"];
                for (NSDictionary *dict in urls) {
                    NSString *imageStr = [[NSString alloc] initWithFormat:@"http://pic.108tian.com/pic/%@",dict[@"url"]];
                    [banner addObject:imageStr];
                }
                //开放时间
                NSDictionary *dict1 = obj[@"data"][@"openinghours"];
                [dict addEntriesFromDictionary:dict1];
                //最佳季节
                NSString *suggestTime = obj[@"data"][@"suggestTime"];
                //优惠信息
                NSString *tickets = obj[@"data"][@"tickets"][@"desc"];
                [dict setValue:suggestTime forKey:@"suggestTime"];
                [dict setValue:tickets forKey:@"tickets"];
                
                NSArray *paragraph = obj[@"data"][@"details"][@"paragraph"];
          
                for (NSDictionary *paragraphdict in paragraph){
                    
                    NSString *subtitle = paragraphdict[@"subtitle"];
                    [dataArray addObject:subtitle];
                    [keyArr addObject:@"subtitle"];
                    NSArray *body = paragraphdict[@"body"];
                    for (NSDictionary *bodydict in body) {
                        for(NSString *key in [bodydict allKeys]){
                            if ([key isEqual:@"text"]){
                                [keyArr addObject:key];
                                [dataArray addObject:bodydict[@"text"]];
                            
                            }
                            if ([key isEqual:@"img"]){
                                [keyArr addObject:key];
                                NSString *imageUrl = [[NSString alloc] initWithFormat:@"%@%@",PICURL,bodydict[@"img"][@"url"]];
                                [dataArray addObject:imageUrl];
                            
                            }
                            
                        
                        }
      
                    }
                    
                }
                
                
            }
                  NSLog(@"%lu",(unsigned long)dataArray.count);
             NSLog(@"%lu",(unsigned long)keyArr.count);
            dispatch_sync(dispatch_get_main_queue(), ^{
                callBack(banner,sectionStr,dict,dataArray,keyArr,error);
            });
        
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                callBack(nil,nil,nil,nil,nil,error);
            });
        
        }
       
        
        
        
        
    }];
    



}


@end
