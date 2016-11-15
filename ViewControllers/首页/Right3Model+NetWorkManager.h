//
//  Right3Model+NetWorkManager.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/21.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "Right3Model.h"

@interface Right3Model (NetWorkManager)
+(void)requestData:(NSString *)str Id:(NSString *)Id callBack:(void(^)(NSArray *banner,NSArray *sectionStr,NSDictionary *dict,NSArray *dataArray,NSArray *keyArr,NSError *error))callBack;

@end














