//
//  BaseViewController.m
//  微博002
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "UIFactory.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _isBackButton = YES ;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (self.navigationController.viewControllers.count > 1 && _isBackButton) {
        UIButton *btn = [UIFactory createButton:@"navigationbar_back.png" highlight:@"navigationbar_back_highlighted.png"];
        btn.frame = CGRectMake(0, 0, 24, 24);
        [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        self.navigationItem.leftBarButtonItem = [item autorelease];
    }
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//    titleLabel.textColor = [UIColor blackColor];
    UILabel *titleLabel = [UIFactory createLabel:kNavigationBarTitileColor];
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:18.0f];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = title;
    [titleLabel sizeToFit];
    
    self.navigationItem.titleView = titleLabel;
} // override 设置标题方法

- (SinaWeibo *)sinaweibo
{
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    SinaWeibo *sinaweibo = appDelegate.sinaweibo;
    return sinaweibo;
}

#pragma mark - Action
- (void)btnAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Memory Manager
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
