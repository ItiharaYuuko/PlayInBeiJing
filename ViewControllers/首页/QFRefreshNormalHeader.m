//
//  QFRefreshNormalHeader.m
//  Pokitchen
//
//  Created by 夏婷 on 16/10/12.
//  Copyright © 2016年 夏婷. All rights reserved.
//

#import "QFRefreshNormalHeader.h"

@implementation QFRefreshNormalHeader
//改变触发下拉刷新的header的位置
-(void)placeSubviews{
    [super placeSubviews];
    self.mj_y = - self.mj_h - self.ignoredScrollViewContentInsetTop - 80;

}


@end
