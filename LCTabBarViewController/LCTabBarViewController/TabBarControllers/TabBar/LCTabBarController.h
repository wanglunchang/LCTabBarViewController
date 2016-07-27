//
//  LCTabBarController.h
//  LCTabBarViewController
//
//  Created by mac on 16/7/21.
//  Copyright © 2016年 Mac.LC_Allen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCTabBarController : UITabBarController

- (void)setTatBar;

- (void)tabBarChildViewController:(UIViewController* )vc tabTitle:(NSString *)title norImage:(UIImage *)norImage selImage:(UIImage *)selImage;

@end
