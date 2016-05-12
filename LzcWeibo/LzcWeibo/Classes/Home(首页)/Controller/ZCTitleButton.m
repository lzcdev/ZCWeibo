//
//  ZCTitleButton.m
//  LzcWeibo
//
//  Created by LuzhiChao on 16/5/12.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import "ZCTitleButton.h"

#define ZCTitleButtonImageW 30;
@implementation ZCTitleButton
+ (instancetype)titleButton
{
    return [[self alloc]init];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        //居中
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        [self setBackgroundImage:[UIImage resizeImagedWithName:@"navigationbar_filter_background_highlighted_os7"] forState:UIControlStateHighlighted];
         [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGFloat imageY = 0;
    CGFloat imageW = ZCTitleButtonImageW;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = contentRect.size.width- ZCTitleButtonImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);

}
@end
