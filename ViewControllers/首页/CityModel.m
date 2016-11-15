//
//  CityModel.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/14.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "CityModel.h"
@implementation CityModel
+(JSONKeyMapper *)keyMapper{
    //模型的属性名作为字典的key，被解析的字典中的key名作为value
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"Id":@"id"}];
    
    
}

@end
