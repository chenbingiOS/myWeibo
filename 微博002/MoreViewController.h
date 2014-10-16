//
//  MoreViewController.h
//  微博002
//
//  更多视图控制器
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "BaseViewController.h"

@interface MoreViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@end
