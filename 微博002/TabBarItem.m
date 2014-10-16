//
//  TabBarItem.m
//  微博002
//
//  Created by qianfeng on 14-10-13.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import "TabBarItem.h"

@implementation TabBarItem

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((contentRect.size.width - 30)/2.0 , (contentRect.size.height - 30)/2.0, 30, 30);
}

@end
