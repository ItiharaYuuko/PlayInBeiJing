//
//  LeftButtonViewController.h
//  PlayInBeiJing
//
//  Created by qianfeng on 16/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "BaseViewController.h"
#import "SearchViewController.h"
#import "CityModel.h"
@protocol LeftDelegate<NSObject>
@required
-(void)passValue1:(NSString*)cityName;

@end

@interface LeftButtonViewController : BaseViewController

@property (nonatomic,strong) NSMutableArray *cityModelArray;
@property (nonatomic,weak) id <LeftDelegate>delegate;



@end
