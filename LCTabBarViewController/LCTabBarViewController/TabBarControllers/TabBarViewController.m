//
//  TabBarViewController.m
//  LCTabBarViewController
//
//  Created by mac on 16/7/21.
//  Copyright © 2016年 Mac.LC_Allen. All rights reserved.
//

#import "TabBarViewController.h"
#import "ViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titArr = @[@"Main0",@"Shop1",@"Share2",@"More3",@"Mine4"];// tabbar标题
    NSArray *norImg = @[@"v2_home",@"v2_order",@"v2_share",@"shopCart",@"v2_my"]; // 正常图片
    NSArray *selImg = @[@"v2_home_r",@"v2_order_r",@"v2_share_r",@"shopCart_r",@"v2_my_r"]; // 高亮图片
    
    // 创建的N个视图控制器
    ViewController *hallVC = [[ViewController alloc] init];
    ViewController *arenaVC = [[ViewController alloc] init];
    ViewController *discoverVC = [[ViewController alloc] init];
    ViewController *historyVC = [[ViewController alloc] init];
    ViewController *Minevc = [[ViewController alloc] init];
    
    [self tabBarChildViewController:hallVC tabTitle:titArr[0] norImage:[UIImage imageNamed:norImg[0]] selImage:[UIImage imageNamed:selImg[0]]];
    [self tabBarChildViewController:arenaVC tabTitle:titArr[1] norImage:[UIImage imageNamed:norImg[1]] selImage:[UIImage imageNamed:selImg[1]]];
    [self tabBarChildViewController:discoverVC tabTitle:titArr[2] norImage:[UIImage imageNamed:norImg[2]] selImage:[UIImage imageNamed:selImg[2]]];
    [self tabBarChildViewController:historyVC tabTitle:titArr[3] norImage:[UIImage imageNamed:norImg[3]] selImage:[UIImage imageNamed:selImg[3]]];
    [self tabBarChildViewController:Minevc tabTitle:titArr[4] norImage:[UIImage imageNamed:norImg[4]] selImage:[UIImage imageNamed:selImg[4]]];
    
    // 使用自定义TatBar
    [self setTatBar];
}


@end
