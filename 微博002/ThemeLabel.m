//
//  ThemeLabel.m
//  微博002
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "ThemeLabel.h"
#import "ThemeManager.h"

@implementation ThemeLabel

- (id)init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

- (id)initWithColorName:(NSString *)colorName
{
    self = [self init];
    if (self)
    {
        self.colorName = colorName;
    }
    return self;
}

- (void)setColorName:(NSString *)colorName
{
    if (_colorName != colorName)
    {
        [_colorName release];
        _colorName = [colorName copy];
    }
    [self setColor];
}

- (void)setColor
{
    UIColor *textColor = [[ThemeManager sharedManager] getCololWithName:_colorName];
    self.textColor = textColor;
}


#pragma mark - Action
- (void)themeNotification:(NSNotification *)notification
{
    [self setColor];
}

#pragma mark - Memory Manager
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_colorName release];
    [super dealloc];
}
@end
