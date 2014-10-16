//
//  BaseNavigationController.m
//  微博002
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "BaseNavigationController.h"
#import "ThemeManager.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotificationAction:) name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadThemeView];
}

- (void)loadThemeView
{
    float version = WXHLOSVersion();
    if (version >= 5.0) {
        
        UIImage *image = [[ThemeManager sharedManager] getThemeImage:@"navigationbar_background.png"];
        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
        
//    if ([self.navigationBar respondsToSelector:@selector(setBackButtonBackgroundImage:forState:)]) {
//      [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
//    }
    }
    else
    {
        // 调用 setNeedsDisplay 让渲染引擎异步调用 drawRect方法
        [self.navigationBar setNeedsDisplay];
    }
} // 加载导航栏背景图片

#pragma mark - Action
- (void)themeNotificationAction:(NSNotification *)notification
{
    [self loadThemeView];
}
#pragma mark - Memory Manager
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
    [super dealloc];
}

@end
