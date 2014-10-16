//
//  CONSTS.h
//  微博002
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#ifndef __002_CONSTS_h
#define __002_CONSTS_h

// 微博 OAuthu 2.0 认证
#define kAppKey @"3706424068"
#define kAppSecret @"b13c1e1c97754834e6419c29d7048bd0"
#define kAppRedirectURI @"https://api.weibo.com/oauth2/default.html"

// 获取设置的物理宽度
#define kDeviceScreenWidth [UIScreen mainScreen].bounds.size.width
// 获取设置的物理高度
#define kDeviceScreenHeight [UIScreen mainScreen].bounds.size.height

// 颜色转化
#define Color(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];

// font Color key
#define kNavigationBarTitileColor @"kNavigationBarTitileColor"
#define kListTitleLabel           @"kListTitleLabel"

// Theme key
#define kThemeName @"kThemeName"

#endif

