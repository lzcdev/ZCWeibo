//
//  ZCTabBar.h
//  LzcWeibo
//
//  Created by LuzhiChao on 16/4/19.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZCTabBar;

@protocol ZCTabBarDelegate <NSObject>

@optional

- (void)tabBar:(ZCTabBar *)tabBar didseletedButtonFrom:(int)from to:(int)to;

@end

@interface ZCTabBar : UIView

- (void)addTabBarButonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id<ZCTabBarDelegate> delegate;

@end
