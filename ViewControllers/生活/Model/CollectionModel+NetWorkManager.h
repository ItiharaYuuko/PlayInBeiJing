//
//  CollectionModel+NetWorkManager.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "CollectionModel.h"

@interface CollectionModel (NetWorkManager)
//请求日子模块的数据
+(void)requestCollectionModelData:(void(^)(NSArray *array, NSError *error))callBack;
@end







