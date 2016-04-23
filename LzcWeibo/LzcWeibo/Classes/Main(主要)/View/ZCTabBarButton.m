//
//  ZCTabBarButton.m
//  LzcWeibo
//
//  Created by LuzhiChao on 16/4/20.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//
//图标的比例
#define ZCTabBarButtonImageRatio 0.6

#import "ZCTabBarButton.h"

@implementation ZCTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        //文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
       //字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:13];
       //文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
         [self setTitleColor:[UIColor colorWithRed:234/255.0 green:103/255.0 blue:7/255.0 alpha:1.000] forState:UIControlStateSelected];
        if (!iOS7) {
            //非iOS7下，设置选中的背景
         [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
            
        }
        //添加一个提醒数字按钮
        ZCBadgeButton *badgeButton = [[ZCBadgeButton alloc]init];
        badgeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
        [self addSubview:badgeButton];
        self.badgeButton = badgeButton;

    }
    return self;
}
//重写去掉高亮状态
- (void)setHighlighted:(BOOL)highlighted
{
    
}
//内部图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * ZCTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}
//内部文字的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * ZCTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
//设置item
- (void)setItem:(UITabBarItem *)item
{
   
    _item = item;
    
//    //设置文字
//    [self setTitle:item.title forState:UIControlStateNormal];
//    //设置图片
//    [self setImage:item.image forState:UIControlStateNormal];
//    [self setImage:item.selectedImage forState:UIControlStateSelected];
//    //设置提醒数字
//    if (self.item.badgeValue) {
//        self.badgeButton.hidden = NO;
//        //设置文字
//        [self.badgeButton setTitle:item.badgeValue forState:UIControlStateNormal];
//        //设置frame
//        //文字尺寸
//        CGFloat badgeY = 5;
//        CGFloat badgeW = self.badgeButton.currentBackgroundImage.size.width;
//        if (item.badgeValue.length > 1) {
//            CGSize badgeSize = [item.badgeValue sizeWithFont:self.badgeButton.titleLabel.font];
//            
//            badgeW = badgeSize.width + 10;
//            
//        }
//        CGFloat badgeH = self.badgeButton.currentBackgroundImage.size.height;
//        CGFloat badgeX = self.frame.size.width - badgeW - 10;
//        self.badgeButton.frame = CGRectMake(badgeX, badgeY, badgeW, badgeH);
//        
//        
//    }else
//    {
//        self.badgeButton.hidden = YES;
//    }
//
    
    //KVO 监听属性改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];

}
//self销毁的时候移除监听
- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}
/**
 *  监听到某个对象的属性改变了就会调用
 *
 *  @param keyPath 属性名
 *  @param object  哪个对象的属性被改了
 *  @param change  属性发生的改变
 *  @param context <#context description#>
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //设置文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    //设置图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    //设置提醒数字
    self.badgeButton.badgeValue = self.item.badgeValue;
    //设置提醒数字的位置
    //文字尺寸
    CGFloat badgeY = 5;
    CGFloat badgeX = self.frame.size.width - self.badgeButton.frame.size.width - 10;
    CGRect badgeF = self.badgeButton.frame;
    badgeF.origin.x = badgeX;
    badgeF.origin.y = badgeY;

    self.badgeButton.frame = badgeF;
    

}
@end
