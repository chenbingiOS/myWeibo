//
//  ThemeButton.h
//  微博002
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import <UIKit/UIKit.h>

#define __string(__k__) @property (nonatomic, copy) NSString *(__k__)
@interface ThemeButton : UIButton

__string(imageName);
__string(highlightImageName);

__string(backgroundImageName);
__string(backgroundHighlightImageName);

- (id)initWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightedImageName;
- (id)initWithBackground:(NSString *)backgroundImageName
     highlightBackground:(NSString *)backgroundHighlightImageName;


@end
