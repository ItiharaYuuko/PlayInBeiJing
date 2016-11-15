//
//  CollectionModel.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "CollectionModel.h"

@implementation CollectionModel

//当模型中的属性个数和字典中的key的个数不完全匹配时, 让赋值能够正常进行
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

@end






