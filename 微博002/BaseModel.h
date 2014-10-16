//
//  BaseModel.h
//  爱限免008
//
//  Created by qianfeng on 14-10-10.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "WXBaseModel.h"

#define __string(__k__)     @property (nonatomic, copy)     NSString     *(__k__)
#define __number(__k__)     @property (nonatomic, retain)   NSNumber     *(__k__)
#define __dictionary(__k__) @property (nonatomic, retain)   NSDictionary *(__k__)

@interface BaseModel : NSObject

// 使用JSon解析数据，返回解析后的数据数组
+ (NSMutableArray *)parsingWithArrayDataForJSon:(NSData *)aData;
// 解析后返回一个数据对象
+ (id)parsingWithModelDataForJSon:(NSData *)aData;

// 使用XML解析数据，返回解析后的数据数组
+ (NSMutableArray *)parsingWithArrayDataForXML:(NSData *)aData;
// 解析后返回一个数据对象
+ (id)parsingWithModelDataForXML:(NSData *)aData;


@end
