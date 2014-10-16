//
//  MainTabBarController.m
//  微博002
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "ProfileViewController.h"
#import "DiscoverViewController.h"
#import "MoreViewController.h"
#import "BaseNavigationController.h"
#import "TabBarItem.h"
#import "UIFactory.h"

@interface MainTabBarController ()
{
    UIImageView *_tabBar;
    UIImageView *_slider;
}
@end

@implementation MainTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.隐藏系统标签栏
    self.tabBar.hidden = YES;
    
    // 2.创建标签栏视图（imageView）
    [self createTabBar];
    
    // 3.创建标签栏按钮
    [self createTabBarItem];
    
    // 4.初始化视图控制器数组
    [self initViewCtrls];
}

- (void)createTabBar
{
    _tabBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, kDeviceScreenHeight - 49, kDeviceScreenWidth, 49)];
    _tabBar.userInteractionEnabled = YES;
    _tabBar.image = [UIImage imageNamed:@"tabbar_background.png"];
    [self.view addSubview:_tabBar];
    
    UIImageView *tabBarGroundImage = [UIFactory createImageView:@"tabbar_background.png"];
    tabBarGroundImage.frame = _tabBar.bounds;
    tabBarGroundImage.userInteractionEnabled = YES;
    [_tabBar addSubview:tabBarGroundImage];

}
- (void)createTabBarItem
{
    NSArray *imageArray = @[@"tabbar_home.png",
                            @"tabbar_message_center.png",
                            @"tabbar_profile.png",
                            @"tabbar_discover.png",
                            @"tabbar_more.png"];
    NSArray *imageHighligthArray = @[@"tabbar_home_highlighted.png",
                            @"tabbar_message_center_highlighted.png",
                            @"tabbar_profile_highlighted.png",
                            @"tabbar_discover_highlighted.png",
                            @"tabbar_more_highlighted.png"];
    
    for (int i = 0; i < imageArray.count; i++)
    {
//        TabBarItem *btn = [TabBarItem buttonWithType:UIButtonTypeCustom];
//        TabBarItem *btn = [[TabBarItem alloc] initWithImage:imageArray[i] highlightedImage:imageHighligthArray[i]];
        UIButton  *btn = [UIFactory createButton:imageArray[i] highlight:imageHighligthArray[i]];
        btn.frame = CGRectMake(i*kDeviceScreenWidth/5.0 + (64-30)/2.0, (49-30)/2.0, 30, 30);
//        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:imageHighligthArray[i]] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(tabBarItemAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i + 100;
        [_tabBar addSubview:btn];
    }
    
    // 底部光标,用于提示
    _slider = [UIFactory createImageView:@"tabbar_slider.png"];
    _slider.frame = CGRectMake((kDeviceScreenWidth/5.0 - 15)/2.0, 5, 15, 44);
    _slider.backgroundColor = [UIColor clearColor];
    [_tabBar addSubview:_slider];
}

- (void)initViewCtrls
{
    HomeViewController *home = [[HomeViewController alloc] init];
    MessageViewController *message = [[MessageViewController alloc] init];
    ProfileViewController *profile = [[ProfileViewController alloc] init];
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    MoreViewController *more = [[MoreViewController alloc] init];
    
    NSArray *vcArray = @[home, message, profile, discover, more];
    NSMutableArray *viewCtrls = [NSMutableArray arrayWithCapacity:5];
    for (UIViewController *vc in vcArray)
    {
        BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
        [viewCtrls addObject:nav];
        [nav release];
    }
    self.viewControllers = viewCtrls;
}

#pragma mark - Action
- (void)tabBarItemAction:(UIButton *)btn
{
    self.selectedIndex = btn.tag - 100;
    
    // 改变底部光标的位置
    float x = btn.left + (btn.width - _slider.width)/2.0;
    [UIView animateWithDuration:0.2 animations:^{
        _slider.left = x;
    }];
    
}


#pragma mark - SinaWeibo Delegate
- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
{
    NSLog(@"sinaweiboDidLogIn");
    // 保存认证的数据到本地
    NSDictionary *authData = [NSDictionary dictionaryWithObjectsAndKeys:
                              sinaweibo.accessToken, @"AccessTokenKey",
                              sinaweibo.expirationDate, @"ExpirationDateKey",
                              sinaweibo.userID, @"UserIDKey",
                              sinaweibo.refreshToken, @"refresh_token", nil];
    [[NSUserDefaults standardUserDefaults] setObject:authData forKey:@"SinaWeiboAuthData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo
{
    NSLog(@"sinaweiboDidLogOut");
    // 移除认证的数据
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"SinaWeiboAuthData"];
}
- (void)sinaweiboLogInDidCancel:(SinaWeibo *)sinaweibo
{
    NSLog(@"sinaweiboLogInDidCancel");
}

@end
