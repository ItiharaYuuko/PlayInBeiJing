//
//  TableViewModel+NetWorkManager.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "TableViewModel.h"

@interface TableViewModel (NetWorkManager)
+(void)getTableViewModelData:(void(^)(NSArray *array, NSError *error))callBack;
@end
