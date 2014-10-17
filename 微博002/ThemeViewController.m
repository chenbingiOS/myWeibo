//
//  ThemeViewController.m
//  微博002
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "ThemeViewController.h"
#import "ThemeManager.h"
#import "UIFactory.h"

@interface ThemeViewController ()
{
    NSArray *_themeArray;
}
@end

@implementation ThemeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _themeArray = [[[ThemeManager sharedManager] themePlist] allKeys];
        [_themeArray retain];
        
        self.title = @"主题切换";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}

#pragma mark - UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _themeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *themeCellID = @"chemeCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:themeCellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:themeCellID];
        
        UILabel *textLabel = [UIFactory createLabel:kListTitleLabel];
        textLabel.frame = CGRectMake(10, 10, 200, 24);
        textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.tag = 2013;
        
        [cell.contentView addSubview:textLabel];
    }
    UILabel *textlabel = (UILabel *)[cell.contentView viewWithTag:2013];
    NSString *cellThemeName = _themeArray[indexPath.row];
    textlabel.text = cellThemeName;
    
    NSString *themeName = [[ThemeManager sharedManager] themeName];
    // 给选中主题添加打钩
    if (themeName == nil) {
        themeName = @"默认";
    }
    if ([themeName isEqualToString:cellThemeName])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *themeName = _themeArray[indexPath.row];
    if ([themeName isEqualToString:@"默认"])
    {
        themeName = nil;
    }
    
    // 保存选中的主题
    [[NSUserDefaults standardUserDefaults] setObject:themeName forKey:kThemeName];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[ThemeManager sharedManager] setThemeName:themeName];
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeDidChangeNotification object:themeName];
    
    [tableView reloadData];
}
@end
