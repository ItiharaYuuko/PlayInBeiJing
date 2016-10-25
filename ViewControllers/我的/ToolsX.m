//
//  ToolsX.m
//  PlayInBeiJing
//
//  Created by qianfeng on 2016/10/13.
//  Copyright © 2016年 张琦. All rights reserved.
//

#import "ToolsX.h"

@implementation ToolsX
+ (NSMutableAttributedString *) createAttributeStr : (NSString *) insertString {
    NSMutableAttributedString * attribStr = [[NSMutableAttributedString alloc] initWithString: insertString] ;
    for (int m = 0 ; m < [attribStr length] ; m ++) {
        [attribStr addAttribute: NSForegroundColorAttributeName value: [self getRandomColor] range: NSMakeRange(m, 1)] ;
    }
    return attribStr ;
}
+ (void) randomColorForTitle : (UINavigationController *) navigationController {
    [[navigationController navigationBar] setTitleTextAttributes: @{NSForegroundColorAttributeName : [self getRandomColor]}] ;
}
+ (UIColor *) getRandomColor {
    UIColor * ranColor = [[UIColor alloc] initWithRed: arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1] ;
    return ranColor ;
}
+ (BOOL) stringPredict : (NSString *) str predictRang : (NSString *) preRange {
//    NSString *preRange = @"^[a-z0－9A-Z]*$";
//    NSString *str = @"Hello100";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", preRange];

    if ([predicate evaluateWithObject:str]) {
        return YES ;
    }
    else
    {
        return NO ;
    }
}
+ (UIAlertController *) createAlertWindow : (nullable NSString *) alertTtile alertMessage : (nullable NSString *) message actionTitle : (nullable NSString *) actionTitle actionResponse : (nullable void (^)()) response{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle: alertTtile message: message preferredStyle: UIAlertControllerStyleAlert] ;
    [alert addAction: [UIAlertAction actionWithTitle: actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (response) {
            response() ;
        }
    }]] ;
    return alert ;
}

+ (AFHTTPSessionManager *) netWorkManager {
    AFHTTPSessionManager * managerTmp = [[AFHTTPSessionManager alloc] init] ;
    [managerTmp setResponseSerializer: [AFHTTPResponseSerializer serializer]] ;
    return managerTmp ;
}

@end
