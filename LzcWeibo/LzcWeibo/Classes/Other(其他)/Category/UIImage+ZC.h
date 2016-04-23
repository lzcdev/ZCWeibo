//
//  UIImage+ZC.h
//  LzcWeibo
//
//  Created by LuzhiChao on 16/4/14.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZC)
/**
 *  加载图片
 *
 *  @param name 图片名
 *
 */
+ (UIImage *)imageWithName:(NSString *)name;

//返回一张自由拉伸的图片 
+ (UIImage *)resizeImagedWithName:(NSString *)name;
@end
