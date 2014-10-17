//
//  WeiboCell.m
//  微博002
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "WeiboCell.h"
#import "WeiboView.h"
#import "WeiboModel.h"
#import "UIImageView+WebCache.h"

@implementation WeiboCell
{
    UIImageView *_userImage;    // 用户头像
    UILabel     *_nickLabel;    // 昵称
    UILabel     *_reWeiboCount; // 转发数
    UILabel     *_commentLabel; // 回复数
    UILabel     *_sourceLabel;  // 发布来源
    UILabel     *_createLabel;  // 发布时间
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self createView];
    }
    return self;
}

- (void)createView
{
    //-----用户头像
    _userImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    _userImage.backgroundColor = [UIColor clearColor];
    _userImage.layer.cornerRadius = 5;
    _userImage.layer.borderWidth = 0.5;
    _userImage.layer.borderColor = [UIColor grayColor].CGColor;
    _userImage.layer.masksToBounds = YES;
    [self.contentView addSubview:_userImage];
    
    //-----昵称
    _nickLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nickLabel.backgroundColor = [UIColor clearColor];
    _nickLabel.font = [UIFont systemFontOfSize:14.0f];
    [self.contentView addSubview:_nickLabel];
    
    //-----转发数
    _reWeiboCount = [[UILabel alloc] initWithFrame:CGRectZero];
    _reWeiboCount.backgroundColor = [UIColor clearColor];
    _reWeiboCount.font = [UIFont systemFontOfSize:12.0f];
    _reWeiboCount.textColor = [UIColor blackColor];
    [self.contentView addSubview:_reWeiboCount];
    
    //-----回复数
    _commentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _commentLabel.backgroundColor = [UIColor clearColor];
    _commentLabel.font = [UIFont systemFontOfSize:12.0f];
    _commentLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_commentLabel];
   
    //-----发布来源
    _sourceLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _sourceLabel.backgroundColor = [UIColor clearColor];
    _sourceLabel.font = [UIFont systemFontOfSize:12.0f];
    _sourceLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_sourceLabel];
    
    //-----发布时间
    _createLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _createLabel.backgroundColor = [UIColor clearColor];
    _createLabel.font = [UIFont systemFontOfSize:12.0f];
    _createLabel.textColor = [UIColor blueColor];
    [self.contentView addSubview:_createLabel];
    
    
    _weiboView = [[WeiboView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_weiboView];
} // 创建子视图

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 用户头像视图
    _userImage.frame = CGRectMake(5, 5, 35, 35);
    NSString *userImageUrl = _weiboModel.user.profile_image_url;
    [_userImage setImageWithURL:[NSURL URLWithString:userImageUrl]];
    
    // 昵称
    _nickLabel.frame = CGRectMake(50, 5, 200, 20);
    _nickLabel.text = _weiboModel.user.screen_name;
    
    // 微博视图
    _weiboView.weiboModel = _weiboModel;
    // 获取微博的高度
    CGFloat height = [WeiboView getWeiboViewHeightWithWeiboModel:_weiboModel isRepostWeibo:NO isDetail:NO];
    _weiboView.frame = CGRectMake(50, _nickLabel.bottom+10, kDeviceScreenWidth - 60, height);
    
} // 载入数据，设置视图布局


@end
