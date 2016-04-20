//
//  ZCTabBar.m
//  LzcWeibo
//
//  Created by LuzhiChao on 16/4/19.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import "ZCTabBar.h"
#import "ZCTabBarButton.h"

@interface ZCTabBar()

@property (nonatomic, weak) ZCTabBarButton *seletedButton;

@end

@implementation ZCTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (! iOS7) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
    }
    return self;
}

- (void)addTabBarButonWithItem:(UITabBarItem *)item
{
    //1.创建按钮
    ZCTabBarButton *button = [[ZCTabBarButton alloc]init];
    [self addSubview:button];
    
    //2.设置数据
    button.item = item;
    
//    [button setTitle:item.title forState:UIControlStateNormal];
//    [button setImage:item.image forState:UIControlStateNormal];
//    [button setImage:item.selectedImage forState:UIControlStateSelected];
//    [button setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];

    //3.设置按钮的点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //4.默认选中第0个按钮
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}

/**
 *  监听按钮的点击
 *
 *  @param button <#button description#>
 */
- (void)buttonClick:(ZCTabBarButton *)button
{
    //1.通知代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didseletedButtonFrom:to:)]) {
        [self.delegate tabBar:self didseletedButtonFrom:_seletedButton.tag to:button.tag];
    }
    
    //2.设置按钮状态
    self.seletedButton.selected = NO;
    button.selected = YES;
    self.seletedButton = button;
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    
    for (int index = 0; index < self.subviews.count; index++) {
        //1.取出按钮
        ZCTabBarButton *button = self.subviews[index];
        
        //2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        //3.绑定tag
        button.tag = index;
    }
}
@end
