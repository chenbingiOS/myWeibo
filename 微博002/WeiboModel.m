//
//  WeiboModel.m
//  微博002
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "WeiboModel.h"

@implementation WeiboModel

//+ (NSMutableArray *)parsingWithDataForDictionary:(NSDictionary *)dict
//{
//    NSArray *array = dict[@"statuses"];
//    NSMutableArray *arr = [[NSMutableArray alloc] init];
//    for (NSDictionary *dictTemp in array) {
//        
//        WeiboModel *model = [[WeiboModel alloc] init];
//        [model setValuesForKeysWithDictionary:dictTemp];
//        
//        [arr addObject:model];
//    }
//    return [arr autorelease];
//}

#pragma mark - #if 0

- (NSDictionary *)attributeMapDictionary {
    NSDictionary *mapAtt = @{
                             @"createDate":@"created_at",
                             @"weiboId":@"id",
                             @"text":@"text",
                             @"source":@"source",
                             @"favorited":@"favorited",
                             @"thumbnailImage":@"thumbnail_pic",
                             @"bmiddleImage":@"bmiddle_pic",
                             @"originalImage":@"original_pic",
                             @"geo":@"geo",
                             @"repostsCount":@"reposts_count",
                             @"commentsCount":@"comments_count"
                             };
    return mapAtt;
}

- (void)setAttributes:(NSDictionary *)dataDic {
    //将字典数据根据映射关系填充到当前对象的属性上。
    [super setAttributes:dataDic];

    NSDictionary *retweetDic = [dataDic objectForKey:@"retweeted_status"];
    if (retweetDic != nil) {
        WeiboModel *relWeibo = [[WeiboModel alloc] initWithDataDic:retweetDic];
        self.retweeted_status = relWeibo;
        [relWeibo release];
    }
    
    NSDictionary *userDic = [dataDic objectForKey:@"user"];
    if (userDic != nil) {
        UserModel *user = [[UserModel alloc] initWithDataDic:userDic];
        self.user = user;
        [user release];
    }

}




@end
