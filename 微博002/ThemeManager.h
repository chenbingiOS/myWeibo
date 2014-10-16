//
//  ThemeManager.h
//  微博002
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kThemeDidChangeNotification @"kThemeDidChangeNotification"

// 主题管理类
@interface ThemeManager : NSObject


@property (nonatomic, copy)   NSString     *themeName;      // 使用的主题的名称
@property (nonatomic, retain) NSDictionary *themePlist;     // 从文件获取主题名称对应的文件夹
@property (nonatomic, retain) NSDictionary *fontColorPlist; // 从文件中获取主题对应的view颜色值

+ (id)sharedManager;

// 返回当前对应主题下，图片名称对应的图片
- (UIImage *)getThemeImage:(NSString *)imageName;

// 返回当前对应主题下，view的的颜色中
- (UIColor *)getCololWithName:(NSString *)aName;
@end
