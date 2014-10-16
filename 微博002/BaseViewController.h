//
//  BaseViewController.h
//  微博002
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"

@interface BaseViewController : UIViewController

@property (nonatomic, assign) BOOL isBackButton;

- (SinaWeibo *)sinaweibo;

@end
