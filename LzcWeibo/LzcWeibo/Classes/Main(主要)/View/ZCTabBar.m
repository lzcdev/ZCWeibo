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

@property (nonatomic, strong) NSMutableArray *tabBarButtons;
@property (nonatomic, weak) ZCTabBarButton *seletedButton;
@property (nonatomic, weak) UIButton *plusButton;
@end

@implementation ZCTabBar

- (NSMutableArray *)tabBarButtons {
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (! iOS7) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
        //添加一个button按钮
        UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"tabbar_compose_icon_add_highlighted_os7"] forState:UIControlStateHighlighted];
        plusButton.bounds = CGRectMake(0, 0, plusButton.currentBackgroundImage.size.width, plusButton.currentBackgroundImage.size.height);
        [self addSubview:plusButton];
        self.plusButton = plusButton;
      
        
    }
    return self;
}

- (void)addTabBarButonWithItem:(UITabBarItem *)item
{
    //1.创建按钮
    ZCTabBarButton *button = [[ZCTabBarButton alloc]init];
    [self addSubview:button];
    
    //2.添加按钮到数组中
    [self.tabBarButtons addObject:button];

    
    //3.设置数据
    button.item = item;
    
//    [button setTitle:item.title forState:UIControlStateNormal];
//    [button setImage:item.image forState:UIControlStateNormal];
//    [button setImage:item.selectedImage forState:UIControlStateSelected];
//    [button setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];

    //4.设置按钮的点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //5.默认选中第0个按钮
    if (self.tabBarButtons.count == 1) {
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
    
    //调整加号按钮的frame
    CGFloat h = self.frame.size.height;
    CGFloat w = self.frame.size.width;
    self.plusButton.center = CGPointMake(w * 0.5, h * 0.5);
    
    
    //按钮的frame数据
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonH = self.frame.size.height;
    
    for (int index = 0; index < self.tabBarButtons.count; index++) {
        //1.取出按钮
        ZCTabBarButton *button = self.tabBarButtons[index];
        
        //2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        if (index > 1) {
            buttonX += buttonW;
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        //3.绑定tag
        button.tag = index;
    }
}
@end
