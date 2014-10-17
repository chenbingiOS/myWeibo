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
#import "SDWebImage/UIImageView+WebCache.h"

#define LIST_FONT           14.0f   //列表中文本字体
#define LIST_REPOST_FONT    13.0f   //列表中转发的文本字体
#define DETAIL_FONT         18.0f   //详情的文本字体
#define DETAIL_REPOST_FONT  17.0f   //详情中转发的文本字体

@implementation WeiboView
{
    RTLabel     *_textLabel;                    // 显示微博内容
    UIImageView *_imageView;                    // 显示微博图片

    WeiboView   *_repostWeiboView;              // 显示转发的微博视图
    UIImageView *_repostWeiboBackgroundView;    // 显示转发的微博视图的背景
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];                      // 在初始化的是否就预先创建好需要显示的视图
    }
    return self;
}

- (void)setWeiboModel:(WeiboModel *)weiboModel
{
    if (_weiboModel != weiboModel)
    {
        [_weiboModel release];
        _weiboModel = [weiboModel retain];
    }
    
    // 在模型对象进行数据传递时，创建转发微博视图，避免循环创建
    if (_repostWeiboView == nil)
    {
        _repostWeiboView = [[WeiboView alloc] initWithFrame:CGRectZero];
        _repostWeiboView.isRepostWeibo = YES;
        [self addSubview:_repostWeiboView];
    }
} // 在设置显示微博数据模型的时候，判断是否存在转发微博

- (void)createView
{
    // 微博内容
    _textLabel = [[RTLabel alloc] initWithFrame:CGRectZero];
    _textLabel.delegate = self;
    _textLabel.font = [UIFont systemFontOfSize:14.0f];
    //十进制RGB值：r:69 g:149 b:203
    //十六进制RGB值：4595CB
    //设置链接的颜色
    _textLabel.linkAttributes = [NSDictionary dictionaryWithObject:@"#4595CB" forKey:@"color"];
    //设置链接高亮的颜色
    _textLabel.selectedLinkAttributes = [NSDictionary dictionaryWithObject:@"blue" forKey:@"color"];
    [self addSubview:_textLabel];
    
    // 微博图片
    _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imageView.backgroundColor = [UIColor clearColor];
    _imageView.image = [UIImage imageNamed:@"page_image_loading.png"];
    //设置图片的内容显示模式：等比例缩/放（不会被拉伸或压缩）
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_imageView];
    
    // 转发的微博视图的背景
    _repostWeiboBackgroundView = [UIFactory createImageView:@"timeline_retweet_background.png"];
    UIImage *image = [_repostWeiboBackgroundView.image stretchableImageWithLeftCapWidth:25 topCapHeight:10];
    _repostWeiboBackgroundView.image = image;
    _repostWeiboBackgroundView.backgroundColor = [UIColor clearColor];
    [self insertSubview:_repostWeiboBackgroundView atIndex:0];
    
} // 创建子视图，用于显示

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//----------微博内容 _textLabel 子视图----------
    CGFloat fontSize = [WeiboView getFontSizeWithIsRepostWeibo:self.isRepostWeibo isDetail:self.isDetail];
    _textLabel.font = [UIFont systemFontOfSize:fontSize];
    _textLabel.frame = CGRectMake(0, 0, self.width, 20);
    if (self.isRepostWeibo)
    {
        _textLabel.frame = CGRectMake(10, 10, self.width - 20, 0);
    }
    _textLabel.text = _weiboModel.text;
    
    // 文本内容尺寸
    CGSize textSize = _textLabel.optimumSize;
    _textLabel.height = textSize.height;
    
//----------转发的微博视图 _repostWeiboView 子视图----------
    // 转发的微博 model
    WeiboModel *repostWeibo = _weiboModel.retweeted_status;
    if (repostWeibo != nil)
    {
        _repostWeiboView.hidden = NO;
        _repostWeiboView.weiboModel = repostWeibo;
    
        // 计算转发微博视图的高度
        CGFloat height = [WeiboView getWeiboViewHeightWithWeiboModel:repostWeibo isRepostWeibo:YES isDetail:self.isDetail];
        _repostWeiboView.frame = CGRectMake(0, _textLabel.bottom, self.width, height);
    }
    else
    {
        _repostWeiboView.hidden = YES;
    }
    
//----------微博图片 _imageView 子视图----------
    NSString *thumbnail_pic = _weiboModel.thumbnailImage;
    if (thumbnail_pic != nil && [@"" isEqualToString:thumbnail_pic])
    {
        _imageView.hidden = NO;
        _imageView.frame = CGRectMake(10, _textLabel.bottom, 70, 80);
        
        // 加载网络图片数据
        [_imageView setImageWithURL:[NSURL URLWithString:thumbnail_pic]];
    }
    else
    {
        _imageView.hidden = YES;
    }
    
//----------转发的微博视图背景 _repostWeiboBackgroundView 子视图----------
    if (self.isRepostWeibo)
    {
        _repostWeiboBackgroundView.frame = self.bounds;
        _repostWeiboBackgroundView.hidden = NO;
    }
    else
    {
        _repostWeiboBackgroundView.hidden = YES;
    }
    
} // layoutSubview 展示数据，设置子视图布局

#pragma mark - calculate
+ (CGFloat)getFontSizeWithIsRepostWeibo:(BOOL)isRepostWeibo isDetail:(BOOL)isDetail
{
    /*
     * LIST_FONT            14.0f    //列表中文本字体
     * LIST_REPOST_FONT     13.0f    //列表中转发的文本字体
     * DETAIL_FONT          18.0f    //详情的文本字体
     * DETAIL_REPOST_FONT   17.0f    //详情中转发的文本字体
     */
    
    CGFloat fontSize = 14.0f;
    if (!isRepostWeibo && !isDetail)
    {
        return LIST_FONT;
    }
    else if (isRepostWeibo && !isDetail)
    {
        return LIST_REPOST_FONT;
    }
    else if (!isRepostWeibo && isDetail)
    {
        return DETAIL_FONT;
    }
    else if (isRepostWeibo && isDetail)
    {
        return DETAIL_REPOST_FONT;
    }
    return fontSize;
}

+ (CGFloat)getWeiboViewHeightWithWeiboModel:(WeiboModel *)weiboModel
                              isRepostWeibo:(BOOL)isRepostWeibo
                                   isDetail:(BOOL)isDetail
{
    /*
     *  计算思路：计算每一个子视图的高度，然后相加
     */
    CGFloat height = 0;
    
//----------计算微博内容 _textLabel 高度-----------
    RTLabel *textLabel = [[RTLabel alloc] initWithFrame:CGRectZero];
    CGFloat fontSize = [WeiboView getFontSizeWithIsRepostWeibo:isRepostWeibo isDetail:isDetail];
    textLabel.font = [UIFont systemFontOfSize:fontSize];
    
    if (isDetail) // 判读这条微博是否是显示在详情页上的
    {
        textLabel.width = kDeviceScreenWidth - 20;
    }
    else
    {
        textLabel.width = kDeviceScreenWidth - 60;
    }
    textLabel.text = weiboModel.text;
    height = height + textLabel.optimumSize.height;
    
//----------计算转发的微博视图 _repostWeiboView 高度-----------
    NSString *thumbnail_pic = weiboModel.thumbnailImage;
    if (thumbnail_pic != nil && [@"" isEqualToString:thumbnail_pic])
    {
        height += (80+10);
    }
    
//----------计算微博图片 _imageView 高度-----------
    // 转发的微博
    WeiboModel *repostWeiboModel = weiboModel.retweeted_status;
    if (repostWeiboModel != nil)
    {
        // 转发的微博的高度
        CGFloat repostHeight = [WeiboView getWeiboViewHeightWithWeiboModel:repostWeiboModel isRepostWeibo:YES isDetail:isDetail];
        height += (repostHeight);
    }
    
    if (isRepostWeibo == YES) {
        height += 30;
    }
    
    return height;
}

#pragma mark - RTLabel delegate
- (void)rtLabel:(id)rtLabel didSelectLinkWithURL:(NSURL*)url
{
}
@end
