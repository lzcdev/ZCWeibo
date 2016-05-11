//
//  ZCSearchBar.m
//  LzcWeibo
//
//  Created by LuzhiChao on 16/5/12.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import "ZCSearchBar.h"


@implementation ZCSearchBar

+ (instancetype)searchBar
{
    return [[self alloc]init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //背景
        self.background = [UIImage resizeImagedWithName:@"searchbar_textfield_background"];
        //左边的放大镜图标
        UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        iconView.contentMode = UIViewContentModeCenter;
        self.leftView = iconView;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.leftView.frame = CGRectMake(0, 0, 30, 30);
       
        //右边的清除按钮
        self.clearButtonMode = UITextFieldViewModeAlways;
        //设置提醒文字
        //searchBar.placeholder = @"搜索";
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索" attributes:attrs];
        //字体
        self.font = [UIFont systemFontOfSize:13];
        
        // 设置键盘右下角按钮的样式
        self.returnKeyType = UIReturnKeyDone;
        self.enablesReturnKeyAutomatically = YES;

    }
    return self;
}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    
//    //设置左边图标的frame
//    self.leftView.frame = CGRectMake(0, 0, 30, self.frame.size.height);
//}
@end
