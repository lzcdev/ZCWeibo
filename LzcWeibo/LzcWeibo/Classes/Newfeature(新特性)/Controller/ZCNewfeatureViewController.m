//
//  ZCNewfeatureViewController.m
//  LzcWeibo
//
//  Created by LuzhiChao on 16/5/15.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import "ZCNewfeatureViewController.h"
#import "LzcTabBarViewController.h"
#define ZCNewfeatureImageCount 3

@interface ZCNewfeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation ZCNewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
   // 1.添加UIScrollView
    [self setupScrollView];
    
    // 2.添加pageControl
    [self setupPageControl];
}

/**
 *  添加pageControl
 */
- (void)setupPageControl
{
    //1.添加
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = ZCNewfeatureImageCount;
    CGFloat centerX = self.view.frame.size.width *0.5;
    CGFloat centerY = self.view.frame.size.height - 30;
    pageControl.center = CGPointMake(centerX, centerY);
    pageControl.bounds = CGRectMake(0, 0, 100, 30);
    pageControl.userInteractionEnabled = NO;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
    // 2.设置圆点的颜色
    pageControl.currentPageIndicatorTintColor = ZCColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = ZCColor(189, 189, 189);
}

/**
 *  添加UIScrollView
 */
- (void)setupScrollView
{
    
    //1.添加UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    //2.添加图片
    CGFloat imageW = scrollView.frame.size.width;
    CGFloat imageH = scrollView.frame.size.height;
    for (int index = 0; index < ZCNewfeatureImageCount; index ++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        //设置frame
        CGFloat imageX = imageW * index;
        imageView.frame = CGRectMake(imageX, 0, imageW, imageH);
        //设置图片
        NSString *name = [NSString stringWithFormat:@"new_feature_%d",index+1];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
        //在最后一个图片上面添加按钮
        if (index == ZCNewfeatureImageCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    
    //3.设置滚动的内容尺寸
    scrollView.contentSize = CGSizeMake(imageW * ZCNewfeatureImageCount, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    //分页
    scrollView.pagingEnabled = YES;
    //弹簧
    scrollView.bounces = NO;

}

/**
 *  添加内容到最后一个图片
 *
 *  @param imageView imageView
 */
- (void)setupLastImageView:(UIImageView *)imageView
{
    // 0.让imageViw能跟用户交互
    imageView.userInteractionEnabled = YES;
    
    // 1.添加开始按钮
    UIButton *startButton = [[UIButton alloc]init];
    [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    
    // 2.设置frame
    CGFloat centerX = imageView.frame.size.width * 0.5;
    CGFloat centerY = imageView.frame.size.height * 0.6;
    startButton.center = CGPointMake(centerX, centerY);
    startButton.bounds = (CGRect){CGPointZero, startButton.currentBackgroundImage.size};
    
    // 3.设置文字
    [startButton setTitle:@"开始微博" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startButton];
    
    // 4.添加checkbox
    UIButton *checkbox = [[UIButton alloc]init];
    checkbox.selected = YES;
    [checkbox setTitle:@"分享给大家" forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    checkbox.bounds = CGRectMake(0, 0, 200, 50);
    CGFloat checkboxCenterX = centerX;
    CGFloat checkboxCenterY = imageView.frame.size.height * 0.5;
    checkbox.center = CGPointMake(checkboxCenterX, checkboxCenterY);
    [checkbox setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    checkbox.titleLabel.font = [UIFont systemFontOfSize:15];
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    checkbox.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [imageView addSubview:checkbox];
}

/**
 *  开始微博
 */
- (void)start
{
    // 显示状态栏
    [UIApplication sharedApplication].statusBarHidden = NO;
    // 切换窗口的根控制器
    self.view.window.rootViewController = [[LzcTabBarViewController alloc]init];
    
}

- (void)checkboxClick:(UIButton *)checkbox
{
    checkbox.selected = !checkbox.isSelected;
}

/**
 *  只要UIScrollView滚动了，就会调用
 *
 *  @param scrollView scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 1.取出水平方向上滚动的距离
    CGFloat offsetX = scrollView.contentOffset.x;
    
    // 2.求出页码
    double pageDouble = offsetX / scrollView.frame.size.width;
    int pageInt = (int)(pageDouble + 0.5);
    self.pageControl.currentPage = pageInt;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
