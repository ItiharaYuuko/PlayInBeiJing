//
//  SpecialModel+NetWorkManager.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/18.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "SpecialModel.h"

@interface SpecialModel (NetWorkManager)
+(void)getSpecialModelData:(void(^)(NSArray *specialArray, NSError *error))callBack;
@end
