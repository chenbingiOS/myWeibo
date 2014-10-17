//
//  WeiboCell.h
//  微博002
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeiboModel;
@class WeiboView;

// 自定义微博 Cell
@interface WeiboCell : UITableViewCell

// 微博模型对象
@property (nonatomic, retain) WeiboModel *weiboModel;

// 转发的微博视图
@property (nonatomic, retain) WeiboView  *weiboView;

@end
