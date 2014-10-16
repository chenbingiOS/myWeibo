//
//  ThemeViewController.h
//  微博002
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "BaseViewController.h"

@interface ThemeViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@end
