
//
//  UIFactory.m
//  微博002
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "UIFactory.h"


@implementation UIFactory

+ (ThemeButton *)createButton:(NSString *)imageName highlight:(NSString *)highlightName
{
    ThemeButton *button = [[ThemeButton alloc] initWithImage:imageName highlightedImage:highlightName];
    return [button autorelease];
}
+ (ThemeButton *)createButtonWithBackground:(NSString *)backgroundimageName
                        highlightBackground:(NSString *)backgroundHighlightName
{
    ThemeButton *button = [[ThemeButton alloc] initWithBackground:backgroundimageName highlightBackground:backgroundHighlightName];
    return [button autorelease];
}


+ (ThemeImageView *)createImageView:(NSString *)imageName
{
    ThemeImageView *imageView = [[ThemeImageView alloc] initWithImageName:imageName];
    return [imageView autorelease];
}

+ (ThemeLabel *)createLabel:(NSString *)colorName
{
    ThemeLabel *label = [[ThemeLabel alloc] initWithColorName:colorName];
    return [label autorelease];
}

@end
