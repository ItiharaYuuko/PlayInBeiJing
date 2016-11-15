//
//  TableViewModel.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/17.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "JSONModel.h"

@interface TableViewModel : JSONModel
@property(nonatomic, copy) NSString *aiDesc;
@property (nonatomic, copy) NSString *aiImg;
@property (nonatomic, copy) NSString *aiTitle;
@property (nonatomic, copy) NSString *aiMd5;

@end
