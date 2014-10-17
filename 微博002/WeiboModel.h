//
//  WeiboModel.h
//  微博002
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "WXBaseModel.h"
#import "UserModel.h"

#define __string(__k__)     @property (nonatomic, copy)     NSString     *(__k__)
#define __number(__k__)     @property (nonatomic, retain)   NSNumber     *(__k__)
#define __dictionary(__k__) @property (nonatomic, retain)   NSDictionary *(__k__)

@interface WeiboModel : WXBaseModel



__string(createdDate);      // 微博创建时间
__string(idstr);            // 字符串型的微博ID
__string(text);             // 微博信息内容
__string(source);           // 微博来源

__string(thumbnailImage);   // 缩略图片地址，没有时不返回此字段
__string(bmiddleImage);     // 中等尺寸图片地址，没有时不返回此字段
__string(originalImage);    // 原始图片地址，没有时不返回此字段

__dictionary(geo);          // 地理信息字段 详细

__number(weiboId);          // 微博ID
__number(favorited);        // 是否已收藏，true：是，false：否
__number(repostsCount);     // 转发数
__number(commentsCount);    // 评论数

@property (nonatomic, retain) WeiboModel *retweeted_status; // 被转发的原微博信息字段，当该微博为转发微博时返回 详细
@property (nonatomic, retain) UserModel  *user;     // 微博作者的用户信息字段 详细

@end


//__string(createdDate);      // 微博创建时间
//__string(idstr);            // 字符串型的微博ID
//__string(text);             // 微博信息内容
//__string(source);           // 微博来源
//
//__string(thumbnail_pic);   // 缩略图片地址，没有时不返回此字段
//__string(bmiddleImage);     // 中等尺寸图片地址，没有时不返回此字段
//__string(originalImage);    // 原始图片地址，没有时不返回此字段
//
//__dictionary(geo);          // 地理信息字段 详细
//
//__number(favorited);        // 是否已收藏，true：是，false：否
//__number(repostsCount);     // 转发数
//__number(commentsCount);    // 评论数


//#if 0
//__string(createdDate);      // 微博创建时间
//__string(idstr);            // 字符串型的微博ID
//__string(text);             // 微博信息内容
//__string(source);           // 微博来源
//
//__string(thumbnailImage);   // 缩略图片地址，没有时不返回此字段
//__string(bmiddleImage);     // 中等尺寸图片地址，没有时不返回此字段
//__string(originalImage);    // 原始图片地址，没有时不返回此字段
//
//__dictionary(geo);          // 地理信息字段 详细
//
//__number(weiboId);          // 微博ID
//__number(favorited);        // 是否已收藏，true：是，false：否
//__number(repostsCount);     // 转发数
//__number(commentsCount);    // 评论数
//
//@property (nonatomic, retain) WeiboModel *relWeibo; // 被转发的原微博信息字段，当该微博为转发微博时返回 详细
//@property (nonatomic, retain) UserModel  *user;     // 微博作者的用户信息字段 详细
//#endif
//

//
//#if 0
//__string(created_at);           // 	string 	微博创建时间
////__number(id);                   // 	int64 	微博ID
//__number(mid);                  // 	int64 	微博MID
//__string(idstr);                // 	string 	字符串型的微博ID
//__string(text);                 // 	string 	微博信息内容
//__string(source);               // 	string 	微博来源
//__number(favorited);            // 	boolean 	是否已收藏，true：是，false：否
//__number(truncated);            // 	boolean 	是否被截断，true：是，false：否
////__string(in_reply_to_status_id);// 	string 	（暂未支持）回复ID
////__string(in_reply_to_user_id);  // 	string 	（暂未支持）回复人UID
////__string(in_reply_to_screen_name);// 	string 	（暂未支持）回复人昵称
//__string(thumbnail_pic);        // 	string 	缩略图片地址，没有时不返回此字段
//__string(bmiddle_pic);          // 	string 	中等尺寸图片地址，没有时不返回此字段
//__string(original_pic);         // 	string 	原始图片地址，没有时不返回此字段
//__dictionary(geo);              // 	object 	地理信息字段 详细
////user 	object 	微博作者的用户信息字段 详细
////retweeted_status 	object 	被转发的原微博信息字段，当该微博为转发微博时返回 详细
//__number(reposts_count);        // 	int 	转发数
//__number(comments_count);       // 	int 	评论数
//__number(attitudes_count);      // 	int 	表态数
////__number(mlevel);               // 	int 	暂未支持
////visible 	object 	微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号
////pic_urls 	object 	微博配图地址。多图时返回多图链接。无配图返回“[]”
////ad 	object array 	微博流内的推广微博ID
//
//#endif
//
//+ (NSMutableArray *)parsingWithDataForDictionary:(NSDictionary *)dict;




/*
 返回值字段 	字段类型 	字段说明
 created_at 	string 	微博创建时间
 id 	int64 	微博ID
 mid 	int64 	微博MID
 idstr 	string 	字符串型的微博ID
 text 	string 	微博信息内容
 source 	string 	微博来源
 favorited 	boolean 	是否已收藏，true：是，false：否
 truncated 	boolean 	是否被截断，true：是，false：否
 in_reply_to_status_id 	string 	（暂未支持）回复ID
 in_reply_to_user_id 	string 	（暂未支持）回复人UID
 in_reply_to_screen_name 	string 	（暂未支持）回复人昵称
 thumbnail_pic 	string 	缩略图片地址，没有时不返回此字段
 bmiddle_pic 	string 	中等尺寸图片地址，没有时不返回此字段
 original_pic 	string 	原始图片地址，没有时不返回此字段
 geo 	object 	地理信息字段 详细
 user 	object 	微博作者的用户信息字段 详细
 retweeted_status 	object 	被转发的原微博信息字段，当该微博为转发微博时返回 详细
 reposts_count 	int 	转发数
 comments_count 	int 	评论数
 attitudes_count 	int 	表态数
 mlevel 	int 	暂未支持
 visible 	object 	微博的可见性及指定可见分组信息。该object中type取值，0：普通微博，1：私密微博，3：指定分组微博，4：密友微博；list_id为分组的组号
 pic_urls 	object 	微博配图地址。多图时返回多图链接。无配图返回“[]”
 ad 	object array 	微博流内的推广微博ID
 */

/*
 {
 "statuses": [
 {
 "created_at": "Tue May 31 17:46:55 +0800 2011",
 "id": 11488058246,
 "text": "求关注。"，
 "source": "<a href="http://weibo.com" rel="nofollow">新浪微博</a>",
 "favorited": false,
 "truncated": false,
 "in_reply_to_status_id": "",
 "in_reply_to_user_id": "",
 "in_reply_to_screen_name": "",
 "geo": null,
 "mid": "5612814510546515491",
 "reposts_count": 8,
 "comments_count": 9,
 "annotations": [],
 "user": {
 "id": 1404376560,
 "screen_name": "zaku",
 "name": "zaku",
 "province": "11",
 "city": "5",
 "location": "北京 朝阳区",
 "description": "人生五十年，乃如梦如幻；有生斯有死，壮士复何憾。",
 "url": "http://blog.sina.com.cn/zaku",
 "profile_image_url": "http://tp1.sinaimg.cn/1404376560/50/0/1",
 "domain": "zaku",
 "gender": "m",
 "followers_count": 1204,
 "friends_count": 447,
 "statuses_count": 2908,
 "favourites_count": 0,
 "created_at": "Fri Aug 28 00:00:00 +0800 2009",
 "following": false,
 "allow_all_act_msg": false,
 "remark": "",
 "geo_enabled": true,
 "verified": false,
 "allow_all_comment": true,
 "avatar_large": "http://tp1.sinaimg.cn/1404376560/180/0/1",
 "verified_reason": "",
 "follow_me": false,
 "online_status": 0,
 "bi_followers_count": 215
 }
 },
 ...
 ],
 "ad": [
 {
 "id": 3366614911586452,
 "mark": "AB21321XDFJJK"
 },
 ...
 ],
 "previous_cursor": 0,                   // 暂未支持
 "next_cursor": 11488013766,    // 暂未支持
 "total_number": 81655
 }
 */