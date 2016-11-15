//
//  ItemModel+NetWorkManager.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "ItemModel.h"

@interface ItemModel (NetWorkManager)
+(void)requestTableViewData:(NSString *)cityId page:(NSString *)page callBack:(void(^)(NSArray *dataSource,NSArray *nameArray,NSArray *subtitleArray,NSError *error))callBack;

@end
