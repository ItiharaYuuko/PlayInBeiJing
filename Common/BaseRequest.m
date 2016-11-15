//
//  BaseRequest.m
//  Pokitchen
//
//  Created by 夏婷 on 16/10/11.
//  Copyright © 2016年 夏婷. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest

+(void)postWithURL:(NSString *)url para:(NSDictionary *)para callBack:(void (^)(NSData *, NSError *))callBack{
    //拼接url的IP地址、资源路径、资源参数
    NSMutableString *urlStr = [[NSMutableString alloc]initWithString:url];
    /*http://www.qf.com:8080/jiaoxue/iOS1610?SID=1610011&name=\%U%D\*/
    
    [urlStr appendFormat:@"%@",[self paraToString:para]];
    
    
    NSURL *URL = [NSURL URLWithString:urlStr];
    //创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    request.HTTPMethod = @"POST";
    //当请求的资源参数数据过大，不能放在资源参数部分时，或者为了不暴露接口的API将相关的请求参数放到请求体中时
    /*
    request.HTTPBody = [NSJSONSerialization dataWithJSONObject:para options:NSJSONWritingPrettyPrinted error:nil];
     */
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        //请求响应的回调block
        callBack(data,error);
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    //启动网络
    [task resume];
}
+(void)getWithURL:(NSString *)url para:(NSDictionary *)para callBack:(void (^)(NSData *, NSError *))callBack{
    
    //拼接url的IP地址、资源路径、资源参数
    NSMutableString *urlStr = [[NSMutableString alloc]initWithString:url];
    //http://www.qf.com:8080/jiaoxue/iOS1610?SID=1610011&name=\%U%D\
    [urlStr appendFormat:@"%@",[self paraToString:para]];
    
    NSURL *URL = [NSURL URLWithString:urlStr];
    //创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    request.HTTPMethod = @"GET";
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        //请求响应的回调block
        callBack(data,error);
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    //启动网络
    [task resume];
    
}

//将para字典拼接为资源参数部分
+(NSString *)paraToString:(NSDictionary *)para{
    NSMutableString *str = [NSMutableString stringWithString:@"?"];
    //遍历字典拼接键值对
    for(NSString *key in para.allKeys){
        
        [str appendFormat:@"%@=%@&",key,para[key]];
    }
    if([str hasSuffix:@"&"]){
        //删除多余的&
        [str deleteCharactersInRange:NSMakeRange(str.length - 1, 1)];
    }
    //如果资源参数中含有中文、或{}#￥@等特殊字符时，进行Unicoude编码
    NSString * paraStr = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    return paraStr;
}


@end
