//
//  RightSearch2Model.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "RightSearch2Model.h"

@implementation RightSearch2Model
//当模型的属性个数和字典中的key的个数不完全匹配时，让赋值能够正常进行
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+(JSONKeyMapper *)keyMapper{
    
    //模型的属性名作为字典的key，被解析的字典中的key名作为value
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"Id":@"id"}];
}

@end
