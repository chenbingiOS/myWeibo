//
//  HomeViewController.m
//  微博002
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "HomeViewController.h"
#import "WeiboModel.h"

@interface HomeViewController ()
{
    NSMutableArray *_cellDataArray;
}
@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"主页";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self _settingUI];
    
    // 判断是否认证
    if (self.sinaweibo.isAuthValid) {
        // 加载微博列表数据
        [self loadWeiboData];
    }
}

#pragma mark -
#pragma mark - UI设置方法 settingUI
- (void)_settingUI
{
    // 绑定按钮
    UIBarButtonItem *bindItem = [[UIBarButtonItem alloc] initWithTitle:@"绑定账号" style:UIBarButtonItemStyleBordered target:self action:@selector(bindAction:)];
    self.navigationItem.rightBarButtonItem = bindItem;
    // 注销按钮
    UIBarButtonItem *logoutItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleBordered target:self action:@selector(logoutAction:)];
    self.navigationItem.leftBarButtonItem = logoutItem;
}

#pragma mark - 载入数据方法 loadData
- (void)loadWeiboData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@"20" forKey:@"count"];
    [self.sinaweibo requestWithURL:@"statuses/home_timeline.json"
                            params:params
                        httpMethod:@"GET"
                          delegate:self];
}

#pragma mark - 微博请求数据协议 SinaWeiboRequestDelegate

// 网络加载失败
- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"网络加载失败：%@", error);
}

// 网络加载完成
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result
{
//    NSLog(@"网络加载成功：%@", result);
  
    _cellDataArray = [WeiboModel parsingWithDataForDictionary:result];
}


#pragma mark - 响应方法 action
- (void)bindAction:(UIBarButtonItem *)item
{
    [self.sinaweibo logIn];
}
- (void)logoutAction:(UIBarButtonItem *)item
{
    [self.sinaweibo logOut];
}

#pragma mark -
#pragma mark - 内存管理方法 Memory Manager
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)dealloc
{
    [super dealloc];
}
//- (void)viewDidUnload
//{
//    
//}
@end
