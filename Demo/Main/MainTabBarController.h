//
//  MainTabBarController.h
//  News
//
//  Created by junFung on 15/9/25.
//  Copyright © 2015年 yc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTabBarController : UITabBarController

@end

/*
 - (void)addChildVC
 {
 HomeViewController *home = [[HomeViewController alloc] init];
 MessageViewController *message = [[MessageViewController alloc] init];
 DiscoverViewController *discover = [[DiscoverViewController alloc] init];
 MeViewController *me = [[MeViewController alloc] init];
 
 [self addChildVC:home withTitle:@"Home" andImageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
 [self addChildVC:message withTitle:@"Message" andImageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
 [self addChildVC:discover withTitle:@"discover" andImageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
 [self addChildVC:me withTitle:@"me" andImageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
 }
 
 - (void)addChildVC:(UIViewController *)viewControl withTitle:(NSString *)title andImageName:(NSString *)image selectedImageName:(NSString *)selectedImage
 {
 MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:viewControl];
 viewControl.title = title;
 viewControl.view.backgroundColor = [UIColor whiteColor];
 
 nav.tabBarItem.image = [UIImage imageNamed:image];
 
UIImage *selectedImageName = [UIImage imageNamed:selectedImage];
selectedImageName = [selectedImageName imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
nav.tabBarItem.selectedImage = selectedImageName;

[self addChildViewController:nav];

}
*/