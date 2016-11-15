//
//  SpecialModel.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "SpecialModel.h"

@implementation SpecialModel

+(JSONKeyMapper *)keyMapper {
    //模型的属性作为字典的key, 被解析的字典中的key名作为value.
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"Description":@"description", @"Id":@"id"}];
}

@end



















