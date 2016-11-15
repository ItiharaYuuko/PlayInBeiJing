//
//  HeaderModel+NetWorkManager.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "HeaderModel.h"
//请求首页的城市数据
@interface HeaderModel (NetWorkManager)
+(void)requestCityData:(NSString *)cityId callBack:(void(^)(NSString *cityName, NSArray *banner,NSArray *bannerImage,NSArray *cityArray,NSError *error))callBack;


@end

















