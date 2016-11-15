//
//  RightSearch2Model+NetWorkManager.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "RightSearch2Model.h"

@interface RightSearch2Model (NetWorkManager)
+(void)requestData:(NSString *)cityId name:(NSString *)name callBack:(void(^)(NSArray *dataArray,NSError *error))callBack;

@end
