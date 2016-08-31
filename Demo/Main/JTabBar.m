//
//  JTabBar.m
//  News
//
//  Created by junFung on 15/9/25.
//  Copyright © 2015年 yc. All rights reserved.
//

#import "JTabBar.h"
#import "UIView+Extension.h"

@implementation JTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.barStyle = UIBarStyleDefault;
        self.tintColor = COLOR_Theme;
        //[self setupComposeButton];
    }
    return self;
}

- (void)setupComposeButton
{
    UIButton *button = [[UIButton alloc] init];
    
    [button setBackgroundImage:[UIImage imageNamed:@"tab_icon"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tab_icon"] forState:UIControlStateSelected];
    
    [button setImage:[UIImage imageNamed:@"tab_icon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"tab_icon"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
 
    [self addSubview:button];
    self.buttonCompose = button;
}

/** 代理通知*/
- (void)onClickButton:(UIButton *)sender
{
    if ([self.JTabBarDelegate respondsToSelector:@selector(JTabBarOnClickCompose:)]) {
        [self.JTabBarDelegate JTabBarOnClickCompose:sender];
    }
}

/** 设置frame*/
- (void)layoutSubviews
{
    [super layoutSubviews];
    //[self setupComposeButtonFrame];
    //[self setupAllTabBarButtonsFrame];
}

- (void)setupComposeButtonFrame
{
    self.buttonCompose.size = self.buttonCompose.currentBackgroundImage.size;
    self.buttonCompose.center = CGPointMake(self.width*0.5, self.height*0.5);
}

- (void)setupAllTabBarButtonsFrame
{
    int indexButton = 0;
    
    for (UIView *tabBarButton in self.subviews) {
        
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
         
            continue;
        }
        
        CGFloat buttonW = self.width/(self.items.count+1);
        CGFloat buttonH = self.height;
        
        tabBarButton.width = buttonW;
        tabBarButton.height = buttonH;
        
        if (indexButton >= 1) {
            
            tabBarButton.x = buttonW*(indexButton+1);
        }else{
            tabBarButton.x = buttonW*indexButton;
        }
        
        tabBarButton.y = 0;
        
        indexButton ++;
    }
}

@end
