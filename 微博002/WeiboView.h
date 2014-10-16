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

// 微博模型对象
@property (nonatomic, retain) WeiboModel *weiboModel;

// 转发的微博视图
@property (nonatomic, retain) WeiboView  *retWeiboView;

// 当前的微博视图时候是转发
@property (nonatomic ,assign) BOOL isRetWeibo;

@end
