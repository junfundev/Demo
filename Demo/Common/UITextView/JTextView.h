//
//  JTextView.h
//  iBuy
//
//  Created by junFung on 15/9/20.
//  Copyright © 2015年 yc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTextView : UITextView
/**
 *  文本占位符
 */
@property (nonatomic, copy) NSString *placehoder;
/**
 *  文本占位符的颜色
 */
@property (nonatomic, strong) UIColor *placehoderColor;

@end
