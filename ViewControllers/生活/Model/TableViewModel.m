//
//  TableViewModel.m
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "TableViewModel.h"

@implementation TableViewModel

//当模型中的属性个数和字典中的key个数不完全匹配时, 让赋值能够正常进行;
+(BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+(JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc]initWithModelToJSONDictionary:@{@"aiDesc":@"ai_desc", @"aiImg":@"ai_img", @"aiTitle":@"ai_title", @"aiMd5":@"ai_md5"}];
}

@end












