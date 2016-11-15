//
//  BaseRequest.h
//  Pokitchen
//
//  Created by 夏婷 on 16/10/11.
//  Copyright © 2016年 夏婷. All rights reserved.
//

#import <Foundation/Foundation.h>
/**网络请求的基类*/
@interface BaseRequest : NSObject

//POST 、GET、DELETE、PUT、 HEADER、TRACE、OPTION
//POST请求方法
+(void)postWithURL:(NSString *)url para:(NSDictionary *)para callBack:(void(^)(NSData *data,NSError *error))callBack;

//GET请求方法
+(void)getWithURL:(NSString *)url para:(NSDictionary *)para callBack:(void(^)(NSData *data,NSError *error))callBack;

//DELETE 类似于GET  PUT类似于POST


@end
