//
//  WeiboView.m
//  微博002
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "WeiboView.h"
#import "UIFactory.h"
#import "WeiboModel.h"

@implementation WeiboView
{
    RTLabel     *_textLabel;                // 微博内容
    UIImageView *_imageView;                // 微博图片
    UIImageView *_retWeiboBackgroundView;   // 转发的微博视图的背景
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    // 微博内容
    _textLabel = [[RTLabel alloc] initWithFrame:CGRectZero];
    _textLabel.delegate = self;
    _textLabel.font = [UIFont systemFontOfSize:14.0f];
    _textLabel.linkAttributes = [NSDictionary dictionaryWithObject:@"#4595CB" forKey:@"color"];
    _textLabel.selectedLinkAttributes = [NSDictionary dictionaryWithObject:@"blue" forKey:@"color"];
    [self addSubview:_textLabel];
    
    // 微博图片
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imageView.image = [UIImage imageNamed:@"page_image_loading.png"];
    
    // 转发的微博视图的背景
    _retWeiboBackgroundView = [UIFactory createImageView:@"timeline_retweet_background.png"];
    UIImage *image = [_retWeiboBackgroundView.image stretchableImageWithLeftCapWidth:25 topCapHeight:10];
    _retWeiboBackgroundView.image = image;
    _retWeiboBackgroundView.backgroundColor = [UIColor clearColor];
    [self insertSubview:_retWeiboBackgroundView atIndex:0];
}

- (void)setWeiboModel:(WeiboModel *)weiboModel
{
    if (_weiboModel != weiboModel) {
        [_weiboModel release];
        _weiboModel = [weiboModel retain];
    }
    
    // 创建转发微博视图
    if (_retWeiboView == nil) {
        _retWeiboView = [[WeiboView alloc] initWithFrame:CGRectZero];
        _retWeiboView.isRetWeibo = YES;
        [self addSubview:_retWeiboView];
    }
}

// layoutSubview 展示数据，设置子视图布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //---------微博内容_textLabel 子视图-----------
    _textLabel.frame = CGRectMake(0, 0, self.width, 20);
    if (self.isRetWeibo) {
        _textLabel.frame = CGRectMake(10, 10, self.width - 20, 0);
    }
    _textLabel.text = _weiboModel.text;
    
    // 文本内容尺寸
    CGSize textSize = _textLabel.optimumSize;
    _textLabel.height = textSize.height;
    
    //---------微博内容_textLabel 子视图-----------
    // 转发的微博 model
    WeiboView *retWeibo = _weiboModel.retweeted_status;
    if (retWeibo == nil) {
        _retWeiboView.weiboModel = retWeibo;
        
    }
    
}

#pragma mark - RTLabel delegate
- (void)rtLabel:(id)rtLabel didSelectLinkWithURL:(NSURL*)url
{
}
@end
