//
//  ThemeLabel.h
//  微博002
//
//  Created by qianfeng on 14-10-16.
//  Copyright (c) 2014年 Glacier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeLabel : UILabel

@property (nonatomic, copy) NSString *colorName;

- (id)initWithColorName:(NSString *)colorName;

@end
