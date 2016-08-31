//
//  MainNavigationController.m
//  News
//
//  Created by junFung on 15/9/25.
//  Copyright © 2015年 yc. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (void)initialize
{
    //1.设置导航条的背景图片，设置全局的背景图片
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    navBar.barTintColor = [UIColor whiteColor];
    
    //2.设置导航条标题字体大小以及颜色
    NSDictionary *barDic = @{
                             NSFontAttributeName:[UIFont systemFontOfSize:16.0],
                             NSForegroundColorAttributeName:[UIColor blackColor]
                             };
    [navBar setTitleTextAttributes:barDic];
    
    //3.设置返回按钮的样式
    //tintColor适用于所有导航条上的item
    navBar.tintColor = [UIColor lightGrayColor];
    
    //4.设置item的字体大小和颜色
    UIBarButtonItem *barItem = [UIBarButtonItem appearanceWhenContainedIn:self, nil];

    NSDictionary *itemDic = @{
                              NSFontAttributeName:[UIFont systemFontOfSize:15.0],
                              NSForegroundColorAttributeName:[UIColor lightGrayColor]
                              };
    [barItem setTitleTextAttributes:itemDic forState:UIControlStateNormal];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
