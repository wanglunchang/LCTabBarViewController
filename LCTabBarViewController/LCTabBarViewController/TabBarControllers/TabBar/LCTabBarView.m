//
//  LCTabBarView.m
//  LCTabBarViewController
//
//  Created by mac on 16/7/21.
//  Copyright © 2016年 Mac.LC_Allen. All rights reserved.
//

#define ScreenWidth     [UIScreen mainScreen].bounds.size.width

#define btnWidth        (ScreenWidth/self.items.count) // tabBar按钮宽度
#define btnHeight       49                             // tabBar按钮高度
#define imageSize       21                             // tabBar图片宽/高度
#define timeInterval    0.08                           // 动画时间

#import "LCTabBarView.h"

@interface LCTabBarView ()

@property (nonatomic,strong) UIImageView  *btnImgView;
@property (nonatomic,strong) UIButton *seletBtn;
@property (nonatomic,strong) UILabel *seletLab;

@end

@implementation LCTabBarView

- (void)setItems:(NSArray *)items{
    _items = items;
    
    // 进行遍历items -->> items里面是一个个的tabBar，
    [items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull tabBarItem, NSUInteger idx, BOOL * _Nonnull stop) {
        // 透明tabBar按钮
        UIButton *tabBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        tabBarBtn.frame = CGRectMake(btnWidth*idx, 0, btnWidth, btnHeight);
        
        // tabBar图片
        _btnImgView = [[UIImageView alloc] initWithImage:tabBarItem.image highlightedImage:tabBarItem.selectedImage];
        _btnImgView.frame = CGRectMake(btnWidth/2-imageSize/2, 10, imageSize, imageSize);
        
        // tabBar标题
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_btnImgView.frame), btnWidth, 17)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:10];
        titleLabel.text = tabBarItem.title;
        titleLabel.textColor = [UIColor grayColor];
        titleLabel.tag = idx+10;
        
        tabBarBtn.tag = idx;
        [tabBarBtn addSubview:_btnImgView];
        [tabBarBtn addSubview:titleLabel];
        
        if (!idx) [self tabBarBtnClick:tabBarBtn];// 默认第0个
        
        [tabBarBtn addTarget:self action:@selector(tabBarBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tabBarBtn];
    }];
}

- (void)tabBarBtnClick:(UIButton *)sender{
    // 二次点击当前的tabBar，释放注释可(return)不再执行动画
//    if (btn == self.seletBtn) return;
    
    ((UIImageView *)self.seletBtn.subviews[0]).highlighted = NO; // 取消高亮
    ((UIImageView *)sender.subviews[0]).highlighted = YES; // 高亮
    
    UILabel *titleLab = ((UILabel *)[sender viewWithTag:sender.tag+10]);
    titleLab.textColor = [UIColor redColor]; // 字体颜色
    if (self.seletLab!=titleLab) self.seletLab.textColor = [UIColor grayColor];
    
    self.seletBtn = sender;
    self.seletLab = titleLab;
    [self tabBarBtnImgAnimate:sender]; // 执行动画
    
    // 获取点击的索引 --> 对应tabBar的索引
    if ([self.delegate respondsToSelector:@selector(LC_tabBar:didSelectItem:)]) {
        [self.delegate LC_tabBar:self didSelectItem:sender.tag];
    }
}

- (void)tabBarBtnImgAnimate:(UIButton*)sender{
    UIView *imageView = sender.subviews[0];
    // 动画执行顺序(样式)
    [UIView animateWithDuration:timeInterval animations:^(void){
         imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.4, 1.4);

    } completion:^(BOOL finished){
         [UIView animateWithDuration:timeInterval animations:
          ^(void){
              imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8, 0.8);
              
          } completion:^(BOOL finished){
              [UIView animateWithDuration:timeInterval animations:
               ^(void){
                   imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.2,1.2);
                   
               } completion:^(BOOL finished){
                   [UIView animateWithDuration:timeInterval animations:
                    ^(void){
                        imageView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
                        
                    } completion:^(BOOL finished){
                    }];
               }];
          }];
     }];
}


@end
