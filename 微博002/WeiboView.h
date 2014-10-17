//
//  WeiboView.h
//  微博002
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTLabel.h"


@class WeiboModel;
@class WeiboView;

@interface WeiboView : UIView < RTLabelDelegate >

@property (nonatomic, retain) WeiboModel *weiboModel;   // 微博模型对象

@property (nonatomic, assign) BOOL isRepostWeibo;       // 当前的微博视图是否转发
@property (nonatomic, assign) BOOL isDetail;            // 微博视图是否显示在详情页面

// 获取字体大小
+ (CGFloat)getFontSizeWithIsRepostWeibo:(BOOL)isRepostWeibo isDetail:(BOOL)isDetail;

// 计算微博视图的高度
+ (CGFloat)getWeiboViewHeightWithWeiboModel:(WeiboModel *)weiboModel isRepostWeibo:(BOOL)isRepostWeibo isDetail:(BOOL)isDetail;


@end
