//
//  ViewController.m
//  LCTabBarViewController
//
//  Created by mac on 16/7/27.
//  Copyright © 2016年 Mac.person. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    switch (self.tabBarController.selectedIndex) {
        case 0:{
            self.title = @"Main0";
            self.view.backgroundColor = [UIColor orangeColor];
        }
            break;
        case 1:{
            self.title = @"Shop1";
            self.view.backgroundColor = [UIColor yellowColor];
        }
            break;
        case 2:{
            self.title = @"Share2";
            self.view.backgroundColor = [UIColor blueColor];
        }
            break;
        case 3:{
            self.title = @"More3";
            self.view.backgroundColor = [UIColor redColor];
        }
            break;
        case 4:{
            self.title = @"Mine4";
            self.view.backgroundColor = [UIColor magentaColor];
        }
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
