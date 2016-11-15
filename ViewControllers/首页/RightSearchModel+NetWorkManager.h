//
//  RightSearchModel+NetWorkManager.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "RightSearchModel.h"

@interface RightSearchModel (NetWorkManager)
+(void)requestRightData:(NSString *)cityId callBack:(void(^)(NSArray *dataArray,NSError *error))callBack;

@end
