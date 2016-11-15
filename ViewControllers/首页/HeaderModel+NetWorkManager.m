//
//  HeaderModel+NetWorkManager.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "HeaderModel+NetWorkManager.h"
#import "CityModel.h"

@implementation HeaderModel (NetWorkManager)
+(void)requestCityData:(NSString *)cityId callBack:(void (^)(NSString * ,NSArray *, NSArray *, NSArray *, NSError *))callBack{
    NSString *url = @"https://api.108tian.com/mobile/v3/Home?cityId=";
    NSString *urlStr = [[NSString alloc] initWithFormat:@"%@%@",url,cityId];
    
    [BaseRequest getWithURL:urlStr para:nil callBack:^(NSData *data, NSError *error) {
        if(!error){
            //解析目录层字典
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            //解析轮播图片的url
            NSArray *banner = obj[@"data"][@"indexBanner"];
            NSString *cityName = obj[@"data"][@"cityName"];
            NSMutableArray *cityArray = [NSMutableArray array];
            NSMutableArray *bannerImage = [NSMutableArray array];
            NSMutableArray *bannerArray = [HeaderModel arrayOfModelsFromDictionaries:banner error:nil];
            for (HeaderModel *headerModel in bannerArray){
                [bannerImage addObject:[NSString stringWithFormat:@"http://pic.108tian.com/pic/%@",headerModel.img]];
            }
            
            NSDictionary *dict = obj[@"data"][@"openCity"];
            for (NSString *key in dict){
                NSArray * arr = dict[key];
                NSMutableArray *array = [CityModel arrayOfModelsFromDictionaries:arr error:nil];
                for (CityModel *city in array){
                    [cityArray addObject:city];
                }
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                callBack(cityName,bannerArray,bannerImage,cityArray,nil);
            });
            
            
        }else{
            dispatch_sync(dispatch_get_main_queue(), ^{
                callBack(nil,nil,nil,nil,error);
            });
            
            
        }
        
    }];

}
@end















