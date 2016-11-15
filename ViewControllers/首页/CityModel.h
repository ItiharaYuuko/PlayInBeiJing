//
//  CityModel.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "JSONModel.h"

@interface CityModel : JSONModel
@property(nonatomic,strong)NSString *city;
@property(nonatomic,strong)NSString *Id;
@property(nonatomic,strong)NSString *name;

@end
