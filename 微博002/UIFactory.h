//
//  UIFactory.h
//  微博002
//
//  Created by qianfeng on 14-10-15.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeButton.h"
#import "ThemeImageView.h"
#import "ThemeLabel.h"

@interface UIFactory : NSObject

+ (ThemeButton *)createButton:(NSString *)imageName highlight:(NSString *)highlightName;
+ (ThemeButton *)createButtonWithBackground:(NSString *)imageName highlightBackground:(NSString *)backgroundHighlightName;


+ (ThemeImageView *)createImageView:(NSString *)imageName;

+ (ThemeLabel *)createLabel:(NSString *)colorName;

@end
