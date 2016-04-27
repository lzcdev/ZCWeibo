//
//  LzcTabBarViewController.m
//  LzcWeibo
//
//  Created by LuzhiChao on 16/4/13.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import "LzcTabBarViewController.h"
#import "LZCHomeTableViewController.h"
#import "LZCMessageTableViewController.h"
#import "LZCDiscoverTableViewController.h"
#import "LZCMeTableViewController.h"
#import "UIImage+ZC.h"
#import "ZCTabBar.h"

@interface LzcTabBarViewController ()<ZCTabBarDelegate>

#pragma mark 自定义TabBar
@property (nonatomic, strong) ZCTabBar *customTabBar;

@end

@implementation LzcTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化TabBar
    [self setupTabBar];

    //初始化所有子控制器
    [self setupAllChildViewController];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //移除系统的TabBar上的按钮
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
    
}
/**
 *  初始化TabBar,自定义的TabBar添加到系统的TabBar上
 */
- (void)setupTabBar
{
    _customTabBar = [[ZCTabBar alloc]init];
    _customTabBar.frame = self.tabBar.bounds;
    _customTabBar.delegate = self;
    [self.tabBar addSubview:_customTabBar];
}

/**
 *  监听tabBar按钮的改变
 *
 *  @param tabBar <#tabBar description#>
 *  @param from   原来选中的位置
 *  @param to     现在选中的位置
 */
- (void)tabBar:(ZCTabBar *)tabBar didseletedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
}

/**
 *  初始化所有子控制器
 */
- (void)setupAllChildViewController
{
    //1. 首页
    LZCHomeTableViewController *home = [[LZCHomeTableViewController alloc]init];
    //home.tabBarItem.badgeValue = @"6";
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    //2. 消息
    LZCMessageTableViewController *message = [[LZCMessageTableViewController alloc]init];
    message.tabBarItem.badgeValue = @"2";
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    //3. 广场
    LZCDiscoverTableViewController *discover = [[LZCDiscoverTableViewController alloc]init];
    //discover.tabBarItem.badgeValue = @"";
    [self setupChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    //4.我
    LZCMeTableViewController *me = [[LZCMeTableViewController alloc]init];
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];

}

/**
 *  初始化一个子控制器
 *
 *  @param childVC           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //1.设置控制器属性
    childVC.title = title;
    childVC.tabBarItem.image = [UIImage imageWithName:imageName];
    if (iOS7) {
        childVC.tabBarItem.selectedImage = [[UIImage imageWithName:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    }else{
        childVC.tabBarItem.selectedImage = [UIImage imageWithName:selectedImageName];
    }
    //2.包装一个导航
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:nav];
    
    [_customTabBar addTabBarButonWithItem:childVC.tabBarItem];

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
