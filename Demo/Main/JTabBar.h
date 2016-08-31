//
//  JTabBar.h
//  News
//
//  Created by junFung on 15/9/25.
//  Copyright © 2015年 yc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JTabBar;

@protocol JTabBarDelegate <NSObject>
- (void)JTabBarOnClickCompose:(UIButton *)sender;
@end

@interface JTabBar : UITabBar

- (instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic, strong) UIButton *buttonCompose;

@property (nonatomic, weak)id<JTabBarDelegate>JTabBarDelegate;

@end
