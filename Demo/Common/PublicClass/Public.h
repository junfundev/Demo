//
//  Public.h
//  aoyouHH
//
//  Created by jinzelu on 15/4/21.
//  Copyright (c) 2015年 jinzelu. All rights reserved.
//

#ifndef aoyouHH_Public_h
#define aoyouHH_Public_h

// 1.判断是否为iOS7,iOS8，iOS9
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

// 2.获得RGB颜色
#define COLOR(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define COLORA(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A/1.0]

#define COLOR_NavigationBarBg [UIColor colorWithRed:24.0/255.0 green:23.0/255.0 blue:29.0/255.0 alpha:1.0]
#define COLOR_ViewBg [UIColor colorWithRed:244.0/255.0 green:244.0/255.0 blue:244.0/255.0 alpha:1.0]

#define COLOR_Theme [UIColor colorWithRed:255/255.0 green:55/255.0 blue:27/255.0 alpha:1.0]

// 4.屏幕大小尺寸
#define WINDOW [UIApplication sharedApplication].keyWindow
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define spacing 10.0

//取view的坐标及长宽
#define W(view) view.frame.size.width
#define H(view) view.frame.size.height
#define X(view) view.frame.origin.x
#define Y(view) view.frame.origin.y

//字体
#define Font(font) [UIFont systemFontOfSize:font]
#define BoldFont(font) [UIFont boldSystemFontOfSize:font]

#endif
