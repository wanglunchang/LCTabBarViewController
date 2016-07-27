//
//  LCTabBarView.h
//  LCTabBarViewController
//
//  Created by mac on 16/7/21.
//  Copyright © 2016年 Mac.LC_Allen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LCTabBarView;
@protocol LCTabBarViewDelegate <NSObject>

// 声明代理方法
- (void)LC_tabBar:(LCTabBarView *_Nonnull)tabBar didSelectItem:(NSInteger)index;

@end

@interface LCTabBarView : UIView

@property(nullable,nonatomic,assign) id<LCTabBarViewDelegate> delegate;
@property(nullable,nonatomic,copy) NSArray *items;

// 取消动画
@property (nonatomic,assign) BOOL cancelAnimation;

@end
