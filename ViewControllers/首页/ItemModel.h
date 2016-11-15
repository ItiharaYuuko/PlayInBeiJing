//
//  ItemModel.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "JSONModel.h"
#import "RecommendModel.h"

@interface ItemModel : JSONModel
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *name;
@property (nonatomic, retain) RecommendModel *recommend;


@end















