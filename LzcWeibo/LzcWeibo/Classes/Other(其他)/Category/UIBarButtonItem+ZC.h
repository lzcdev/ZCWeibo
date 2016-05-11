//
//  UIBarButtonItem+ZC.h
//  LzcWeibo
//
//  Created by LuzhiChao on 16/5/11.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZC)

+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;

@end
