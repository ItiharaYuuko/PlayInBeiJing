//
//  ToolsX.h
//  PlayInBeiJing
//
//  Created by qianfeng on 2016/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
@interface ToolsX : NSObject
+ (NSMutableAttributedString *) createAttributeStr : (NSString *) insertString ;
+ (void) randomColorForTitle : (UINavigationController *) navigationController ;
+ (UIColor *) getRandomColor ;
+ (BOOL) stringPredict : (NSString *) str predictRang : (NSString *) preRange ;
+ (UIAlertController *) createAlertWindow : (nullable NSString *) alertTtile alertMessage : (nullable NSString *) message actionTitle : (nullable NSString *) actionTitle actionResponse : (nullable void (^)()) response ;
+ (AFHTTPSessionManager *) netWorkManager ;
@end
