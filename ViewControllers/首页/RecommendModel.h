//
//  RecommendModel.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "JSONModel.h"

@interface RecommendModel : JSONModel
@property (nonatomic,copy) NSString *Id;
@property (nonatomic,retain) NSMutableArray *lnglat;
@property (nonatomic,copy)NSString *fav;
@property (nonatomic,copy)NSString *price;
@property(nonatomic,retain)NSMutableArray *priceRange;

@end
