//
//  ZCTabBarButton.h
//  LzcWeibo
//
//  Created by LuzhiChao on 16/4/20.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCBadgeButton.h"
@interface ZCTabBarButton : UIButton

@property (nonatomic, strong) UITabBarItem *item;
//右上角提醒数字
@property (nonatomic, weak) ZCBadgeButton *badgeButton;

@end
