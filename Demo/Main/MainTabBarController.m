//
//  MainTabBarController.m
//  News
//
//  Created by junFung on 15/9/25.
//  Copyright © 2015年 yc. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "HomeViewController.h"
#import "AllListViewController.h"
#import "OtherViewController.h"
#import "JTabBar.h"

@interface MainTabBarController ()<JTabBarDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildVC];
    [self setupJTabBar];
}

/** 自定义tabBar*/
- (void)setupJTabBar
{
    JTabBar *tab = [[JTabBar alloc] init];
    tab.JTabBarDelegate = self;
    
    /** 更换系统自带的tabbar*/
    [self setValue:tab forKey:@"tabBar"];
}

- (void)setupTabbar
{
    for (UIView *child in self.tabBar.subviews) {
        
        //如果不是UITabBarButton，就过掉
        if (![child isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            continue;
        }
        
        for (UIView *childchild in child.subviews) {
            
            //UITabBarSelectionIndicatorView
            if ([childchild isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {//说明是个选中背景
                //[childchild removeFromSuperview];
            }
            
            if ([childchild isKindOfClass:[UILabel class]]) {//说明是个label，UITabBarButtonLabel
                UILabel *label = (UILabel *)childchild;
                
                label.font = [UIFont systemFontOfSize:10];
                label.textColor = [UIColor lightGrayColor];
            }
        }
    }
}

#pragma mark --- 添加子视图 ---
- (void)addChildVC
{
    HomeViewController *net = [[HomeViewController alloc] init];
    OtherViewController *other = [[OtherViewController alloc] init];
    AllListViewController *allList = [[AllListViewController alloc] init];
    
    MainNavigationController *navHome = [[MainNavigationController alloc] initWithRootViewController:net];
    MainNavigationController *navMes = [[MainNavigationController alloc] initWithRootViewController:allList];
    MainNavigationController *navMe = [[MainNavigationController alloc] initWithRootViewController:other];

    net.tabBarItem.image = [UIImage imageNamed:@"tab_home_un"];
    net.tabBarItem.selectedImage = [self imageWithRenderingMode:@"tab_home_on"];
    
    other.tabBarItem.image = [UIImage imageNamed:@"tab_me"];
    other.tabBarItem.selectedImage = [self imageWithRenderingMode:@"tab_me_on"];
    
    allList.tabBarItem.image = [UIImage imageNamed:@"tab_list"];
    allList.tabBarItem.selectedImage = [self imageWithRenderingMode:@"tab_list_on"];
    
    net.title = @"首页";
    allList.title = @"分类";
    other.title = @"其他";
    
    allList.view.backgroundColor = COLOR_ViewBg;
    net.view.backgroundColor = COLOR_ViewBg;
    other.view.backgroundColor = COLOR_ViewBg;
    
    [self addChildViewController:navHome];
    [self addChildViewController:navMes];
    [self addChildViewController:navMe];
}

- (UIImage *)imageWithRenderingMode:(NSString *)selectedImage
{
    UIImage *selectedImageName = [UIImage imageNamed:selectedImage];
    return [selectedImageName imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (UIImage *)stretchableImageWithLeftCapWidth:(NSString *)name
{
    UIImage *imageName = [UIImage imageNamed:name];
    return [imageName stretchableImageWithLeftCapWidth:imageName.size.width*0.5 topCapHeight:imageName.size.height*0.5];
}

#pragma mark --- JTabBarDelegate ---
- (void)JTabBarOnClickCompose:(UIButton *)sender
{
    NSLog(@"通知点击");
}

@end
