//
//  ZCNavigationController.m
//  LzcWeibo
//
//  Created by LuzhiChao on 16/4/28.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import "ZCNavigationController.h"

@implementation ZCNavigationController

/**
 *  第一次使用这个类的时候会调用（也就是说只调用一次）
 */
+ (void)initialize
{
    //1.设置导航栏主题
    [self setNabBarTheme];
    
    //2.设置导航栏按钮主题
    [self setNavBarItem];
   
}

+ (void)setNabBarTheme
{
    //取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    //设置背景
    if (! iOS7) {
        [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    }
    
}

+ (void)setNavBarItem
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    //设置背景
    [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_disable"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
     [item setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[UITextAttributeTextColor] = [UIColor blackColor];
    textAttrs[UITextAttributeFont] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateHighlighted];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
      [super pushViewController:viewController animated:animated];
}
@end
