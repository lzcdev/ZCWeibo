//
//  UIImage+ZC.m
//  LzcWeibo
//
//  Created by LuzhiChao on 16/4/14.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import "UIImage+ZC.h"

@implementation UIImage (ZC)
+ (UIImage *)imageWithName:(NSString *)name
{
    if (iOS7) {
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if (image == nil) {
            image = [UIImage imageNamed:name];
        }
        return image;
    }
    return [UIImage imageNamed:name];
}
@end
