//
//  ThemeImageView.m
//  微博002
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "ThemeImageView.h"
#import "ThemeManager.h"

@implementation ThemeImageView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_imageName release];
    [super dealloc];
}

// 使用xib调用后，调用的初始化方法 
- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction:) name:kThemeDidChangeNotification object:nil];
}

- (id)initWithImageName:(NSString *)imageName
{
    self = [self init];
    if (self)
    {
        self.imageName = imageName;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction:) name:kThemeDidChangeNotification object:nil];
    }
    return self;
}
#pragma mark - Notification Action
- (void)notificationAction:(NSNotification *)notification
{
    [self loadThemeImage];
}

- (void)setImageName:(NSString *)imageName
{
    if (_imageName != imageName)
    {
        [_imageName release];
        _imageName = [imageName copy]; 
    }
    [self loadThemeImage];
}

- (void)loadThemeImage
{
    if (_imageName == nil)
    {
        return;
    }
    
    UIImage *image = [[ThemeManager sharedManager] getThemeImage:_imageName];
    self.image = image;
}

@end
