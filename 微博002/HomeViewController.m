//
//  HomeViewController.m
//  微博002
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "HomeViewController.h"
#import "WeiboModel.h"
#import "WeiboCell.h"
#import "WeiboView.h"

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
//        self.title = @"主页";
//        _cellDataArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor redColor];
    [self createUI];
    
    // 判断是否认证
    if (self.sinaweibo.isAuthValid) {
        // 加载微博列表数据
        [self loadWeiboData];
    }
}

- (void)loadWeiboData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@"20" forKey:@"count"];
    [self.sinaweibo requestWithURL:@"statuses/home_timeline.json"
                            params:params
                        httpMethod:@"GET"
                          delegate:self];
}

- (void)createUI
{
    // 绑定按钮
    UIBarButtonItem *bindItem = [[UIBarButtonItem alloc] initWithTitle:@"绑定账号" style:UIBarButtonItemStyleBordered target:self action:@selector(bindAction:)];
    self.navigationItem.rightBarButtonItem = bindItem;
    
    // 注销按钮
    UIBarButtonItem *logoutItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStyleBordered target:self action:@selector(logoutAction:)];
    self.navigationItem.leftBarButtonItem = logoutItem;
}

  #pragma mark -  Sina Weibo Request Delegate
- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"网络加载失败：%@", error);
} // 网络加载失败

- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result
{
    NSLog(@"网络加载成功：%@", result);
    
    NSArray *statues = [result objectForKey:@"statuses"];
    _cellDataArray = [[NSMutableArray alloc] initWithCapacity:statues.count];
    for (NSDictionary *statuesDic in statues) {
        WeiboModel *weibo = [[WeiboModel alloc] initWithDataDic:statuesDic];
        [_cellDataArray addObject:weibo];
        [weibo release];
    }
    
//    _cellDataArray = [WeiboModel parsingWithDataForDictionary:result];
    [_tableView reloadData];
} // 网络加载完成


#pragma mark - TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellDataArray.count;
} // 单元格总数

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentify = @"cellIdentify";
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (cell == nil)
    {
        cell = [[[WeiboCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify] autorelease];
    }
    
    cell.weiboModel = _cellDataArray[indexPath.row];
    return cell;
} // 具体显示每一个单元格

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiboModel *weiboModel = _cellDataArray[indexPath.row];
    CGFloat height = [WeiboView getWeiboViewHeightWithWeiboModel:weiboModel isRepostWeibo:NO isDetail:NO];
    height += 50;
    return height;
} // 每个单元格的高度

#pragma mark - Action
- (void)bindAction:(UIBarButtonItem *)item
{
    [self.sinaweibo logIn];
} // 绑定账号按钮事件

- (void)logoutAction:(UIBarButtonItem *)item
{
    [self.sinaweibo logOut];
} // 注销账号事件


#pragma mark - Memory Manager
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [_tableView release];
    [super dealloc];
}

//- (void)viewDidUnload
//{
//    
//}
@end
