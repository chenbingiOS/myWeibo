//
//  AppDelegate.h
//  微博002
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SinaWeibo;
@class MainTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) SinaWeibo *sinaweibo;
@property (nonatomic, retain) MainTabBarController *mainTabBar;

@end
