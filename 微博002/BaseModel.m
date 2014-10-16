//
//  BaseModel.m
//  爱限免008
//
//  Created by qianfeng on 14-10-10.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

+ (NSMutableArray *)parsingWithArrayDataForJSon:(NSData *)aData
{
    NSLog(@"子类未实现");
    return nil;
}

+ (id)parsingWithModelDataForJSon:(NSData *)aData
{
    NSLog(@"子类未实现");
    return nil;
}

+ (NSMutableArray *)parsingWithArrayDataForXML:(NSData *)aData
{
    NSLog(@"子类未实现");
    return nil;
}

+ (id)parsingWithModelDataForXML:(NSData *)aData
{
    NSLog(@"子类未实现");
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
//    NSLog(@"未解析的键 -- %@",key);
} // 未解析的键

@end
