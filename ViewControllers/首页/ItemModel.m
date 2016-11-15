//
//  ItemModel.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel

+(JSONKeyMapper *)keyMapper{
    //模型的属性名作为字典的key，被解析的字典中的key名作为value
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"Id":@"id"}];
}
-(instancetype)initWithDictionary:(NSDictionary *)dict error:(NSError *__autoreleasing *)err{
    self = [super initWithDictionary:dict error:err];
    if (self) {
        self.recommend = nil;
        //取出存放字典的数组
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:dict[@"recommend"]];
       // NSArray *array = dict[@"recommend"];
        NSError *error = nil;
        //将一个一个的字典转化为RecommendModel 的对象，实际上遍历array中的字典，一个字典对应会创建一个RecommendModel 的对象，并使用字典的值给对象的属性赋值
        
        
        
        self.recommend = [[RecommendModel arrayOfModelsFromDictionaries:array error:&error]firstObject];
    }
    return self;
}

@end
