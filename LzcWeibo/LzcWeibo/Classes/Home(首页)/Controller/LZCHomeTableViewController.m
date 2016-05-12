//
//  LZCHomeTableViewController.m
//  LzcWeibo
//
//  Created by LuzhiChao on 16/4/13.
//  Copyright © 2016年 LuzhiChao. All rights reserved.
//

#import "LZCHomeTableViewController.h"
#import "ZCBadgeButton.h"
#import "UIBarButtonItem+ZC.h"
#import "ZCTitleButton.h"

#define ZCTitleButtonDownTag 0
#define ZCTitleButtonUpTag 1
@interface LZCHomeTableViewController ()

@end

@implementation LZCHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //左边按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_friendsearch_os7" highIcon:@"navigationbar_friendsearch_highlighted_os7" target:self action:@selector(findFriend)];
    //右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_pop_os7" highIcon:@"navigationbar_pop_highlighted_os7" target:self action:@selector(pop)];
    //中间按钮
    ZCTitleButton *titileButton = [ZCTitleButton titleButton];
    //图标
    [titileButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down_os7"] forState:UIControlStateNormal];
    //文字
    [titileButton setTitle:@"haha" forState:UIControlStateNormal];
    //位置
    titileButton.frame = CGRectMake(0, 0, 80, 40);
    titileButton.tag = ZCTitleButtonDownTag;
    [titileButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titileButton;
}

- (void)titleClick:(ZCTitleButton *)titileButton
{
    if (titileButton.tag == ZCTitleButtonUpTag) {
        [titileButton setImage:[UIImage imageNamed:@"navigationbar_arrow_down_os7"] forState:UIControlStateNormal];
        titileButton.tag = ZCTitleButtonDownTag;
    }else
    {
        [titileButton setImage:[UIImage imageNamed:@"navigationbar_arrow_up_os7"] forState:UIControlStateNormal];
        titileButton.tag = ZCTitleButtonUpTag;

    }
    
}

- (void)findFriend
{
    ZCLog(@"a");
}

- (void)pop
{
    ZCLog(@"pop");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
 
 // Configure the cell...
 
 return cell;
 }
 */

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
