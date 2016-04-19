//
//  ZCTabBar.m
//  LzcWeibo
//
//  Created by LuzhiChao on 16/4/19.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import "ZCTabBar.h"

@implementation ZCTabBar

- (void)addTabBarButonWithItem:(UITabBarItem *)item
{
    //1.创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:button];
    
    //2.设置数据
    [button setTitle:item.title forState:UIControlStateNormal];
    [button setImage:item.image forState:UIControlStateNormal];
    [button setImage:item.selectedImage forState:UIControlStateSelected];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    
    for (int index = 0; index < self.subviews.count; index++) {
        //1.取出按钮
        UIButton *button = self.subviews[index];
        
        //2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
    }
}
@end
