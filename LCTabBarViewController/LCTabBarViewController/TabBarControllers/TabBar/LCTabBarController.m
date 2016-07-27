//
//  LCTabBarController.m
//  LCTabBarViewController
//
//  Created by mac on 16/7/21.
//  Copyright © 2016年 Mac.LC_Allen. All rights reserved.
//

#import "LCTabBarController.h"
#import "LCTabBarView.h"

@interface LCTabBarController ()<LCTabBarViewDelegate>

@property (nonatomic, strong)NSMutableArray *tabBarArr;

@end

@implementation LCTabBarController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    for (UIView *childView in self.tabBar.subviews) {
        if (![childView isKindOfClass:[LCTabBarView class]]) {
            // 移除添加到TabbarView之外的视图
            [childView removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarArr = [NSMutableArray array];
}

- (void)setTatBar{
    // 自定义状态
    LCTabBarView *tabBar = [[LCTabBarView alloc] init];
    tabBar.backgroundColor = [UIColor whiteColor];
    tabBar.frame = self.tabBar.bounds;
    tabBar.items = self.tabBarArr;
    tabBar.delegate = self;
    [self.tabBar addSubview:tabBar];
}

- (void)tabBarChildViewController:(UIViewController *)vc tabTitle:(NSString *)title norImage:(UIImage *)norImage selImage:(UIImage *)selImage{
    // 添加导航
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
    tabBarItem.image = norImage; // tabBar正常状态
    tabBarItem.title = title; // tabBar标题
    tabBarItem.selectedImage = selImage; // tabBar高亮状态
    
    // 添加到数组
    [self.tabBarArr addObject:tabBarItem];
    [self addChildViewController:nav];
}

#pragma mark TabbarViewDelegate
- (void)LC_tabBar:(LCTabBarView *)tabBar didSelectItem:(NSInteger)index{
    // 获取点击的索引 --> 对应tabBar索引
    self.selectedIndex = index;
}


@end
