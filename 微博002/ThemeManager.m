//
//  ThemeManager.m
//  微博002
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "ThemeManager.h"

static ThemeManager *_singleton = nil;

@implementation ThemeManager

+ (id)sharedManager
{
    if (_singleton == nil)
    {
        @synchronized (self)
        {
            _singleton = [[ThemeManager alloc] init];
        }
    }
    return _singleton;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        NSString *themePath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"];
        self.themePlist = [NSDictionary dictionaryWithContentsOfFile:themePath];
        
        // 没有设置名称，则表示未默认主题 
        self.themeName = nil;
    }
    return self;
}

- (void)setThemeName:(NSString *)themeName
{
    if (_themeName != themeName) {
        [_themeName release];
        _themeName = [themeName copy];
    }
    
    NSString *themePath = [self getThemePath];
    
    NSString *filePath = [themePath stringByAppendingPathComponent:@"fontColor.plist"];
    
    self.fontColorPlist = [NSDictionary dictionaryWithContentsOfFile:filePath];
    //切换主题，重新加载当前主题下的字体配置文件
//    NSString *themeDir = [self getThemePath];
//    NSString *filePath = [themeDir stringByAppendingPathComponent:@"fontColor.plist"];
//    self.fontColorPlist = [NSDictionary dictionaryWithContentsOfFile:filePath];
} // override setter mehtod

- (NSString *)getThemePath
{
    if (_themeName == nil )
    {
        //如果主题名为空，则使用项目包根目录下的默认主题图片
        NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
        return resourcePath;
    }
    
    // 取得主题路径 如：Skins/blue
    NSString *themePath = [self.themePlist objectForKey:_themeName];
    
    // 程序包的根路径
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    
    // 完整包的路径
    NSString *path = [resourcePath stringByAppendingPathComponent:themePath];
    
    return path;
} // 获取主题目录

- (UIImage *)getThemeImage:(NSString *)imageName
{
    if (imageName.length == 0)
    {
        return nil;
    }
    
    // 获取主题目录
    NSString *themePath = [self getThemePath];
    
    // imageName 在当前主题的路径
    NSString *imagePath = [themePath stringByAppendingPathComponent:imageName];
    
    // 从主题的路径下获取的图片
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
    return image;
} // 返回当前对应主题下，图片名称对应的图片

- (UIColor *)getCololWithName:(NSString *)aName
{
    if (aName.length == 0) {
        return nil;
    }
    
    NSString *rgb = [_fontColorPlist objectForKey:aName];
    
    NSArray *rgbs = [rgb componentsSeparatedByString:@","];
    
    if (rgbs.count == 3) {
        float r = [rgbs[0] floatValue];
        float g = [rgbs[1] floatValue];
        float b = [rgbs[2] floatValue];
        
        UIColor *color = Color(r, g, b, 1);
        
        return color;
    }
    
    return nil;
} // 返回当前对应主题下，view的的颜色中

// 限制当前对象创建多个实例
#pragma mark - singleton setting
+ (id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized (self)
    {
        if (_singleton == nil)
        {
            _singleton = [super allocWithZone:zone];
        }
    }
    return _singleton;
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return self;
}

+ (id)retain
{
    return self;
}

- (unsigned)retainCount
{
    return UINT_MAX;
}

- (oneway void)release
{
    
}

- (id)autorelease
{
    return self;
}

@end
