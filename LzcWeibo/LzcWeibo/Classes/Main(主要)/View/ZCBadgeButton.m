//
//  ZCBadgeButton.m
//  LzcWeibo
//
//  Created by LuzhiChao on 16/4/23.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import "ZCBadgeButton.h"

@implementation ZCBadgeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       self.hidden = YES;
       self.titleLabel.font = [UIFont systemFontOfSize:11];
       self.userInteractionEnabled = NO;
       [self setBackgroundImage:[UIImage resizeImagedWithName:@"main_badge"] forState:UIControlStateNormal];

    }
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = [badgeValue copy];
    
    if (badgeValue) {
        self.hidden = NO;
        //设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        //设置frame
        CGRect frame = self.frame;
        CGFloat badgeH = self.currentBackgroundImage.size.height;
        CGFloat badgeW = self.currentBackgroundImage.size.width;
        if (badgeValue.length > 1) {
            CGSize badgeSize = [badgeValue sizeWithFont:self.titleLabel.font];
            badgeW = badgeSize.width + 10;
        }

        frame.size.width = badgeW;
        frame.size.height = badgeH;
        self.frame = frame;
              
    }else
    {
        self.hidden = YES;
    }
    

}
@end
