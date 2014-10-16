//
//  ThemeButton.m
//  微博002
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManager.h"



@implementation ThemeButton

- (id)initWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightedImageName
{
    self = [self init];
    if (self) {
        self.imageName = imageName;
        self.highlightImageName = highlightedImageName;
    }
    return self;
}
- (id)initWithBackground:(NSString *)backgroundImageName
     highlightBackground:(NSString *)backgroundHighlightImageName
{
    self = [self init];
    if (self) {
        self.backgroundImageName = backgroundImageName;
        self.backgroundHighlightImageName = backgroundHighlightImageName;
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

- (void)themeNotification:(NSNotification *)notification
{
    [self loadThemeImage];
}

// 重新加载图片
- (void)loadThemeImage
{
    ThemeManager *theme = [ThemeManager sharedManager];
    
    UIImage *image = [theme getThemeImage:_imageName];
    UIImage *highlightImage = [theme getThemeImage:_highlightImageName];
    
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:highlightImage forState:UIControlStateHighlighted];
    
    UIImage *backgroundImage = [theme getThemeImage:_backgroundImageName];
    UIImage *backgroundHighlightImage = [theme getThemeImage:_backgroundHighlightImageName];
    
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [self setBackgroundImage:backgroundHighlightImage forState:UIControlStateHighlighted];
    
}

#pragma mark - setter
- (void)setImageName:(NSString *)imageName
{
    if (_imageName != imageName)
    {
        [_imageName release];
        _imageName = [imageName copy];
    }
    // 重新加载图片
    [self loadThemeImage];
}

- (void)setHighlightImageName:(NSString *)highlightImageName
{
    if (_highlightImageName != highlightImageName)
    {
        [_highlightImageName release];
        _highlightImageName = [highlightImageName copy];
    }
    [self loadThemeImage];
}

- (void)setBackgroundImageName:(NSString *)backgroundImageName
{
    if (_backgroundImageName != backgroundImageName)
    {
        [_backgroundImageName release];
        _backgroundImageName = [backgroundImageName copy];
    }
    [self loadThemeImage];
}

- (void)setBackgroundHighlightImageName:(NSString *)backgroundHighlightImageName
{
    if (_backgroundHighlightImageName != backgroundHighlightImageName)
    {
        [_backgroundHighlightImageName release];
        _backgroundHighlightImageName = [backgroundHighlightImageName copy];
    }
    [self loadThemeImage];
}

@end


