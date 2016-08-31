//
//  JButton.m
//  TestDemo
//
//  Created by junFung on 15/7/17.
//  Copyright (c) 2015年 yc. All rights reserved.
//

#import "JButton.h"

@implementation JButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //内部图标居中
        self.imageView.contentMode = UIViewContentModeCenter ;
        self.titleLabel.textAlignment = NSTextAlignmentCenter ;
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        //字体
        self.titleLabel.font = [UIFont systemFontOfSize:13.0f] ;
        //高亮的时候不需要调整内部的图片为灰色
        self.adjustsImageWhenHighlighted = NO;
        
//        self.titleLabel.backgroundColor = [UIColor redColor];
//        self.imageView.backgroundColor = [UIColor orangeColor];
    }
    return self ;
}

/**
 *  设置内部图标的frame
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = self.height;
    CGFloat imageH = imageW;
    CGFloat imageX = self.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

/**
 *  设置内部文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleH = self.height;
    CGFloat titleW = self.width - self.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    [super setTitle:title forState:state];
    //计算文字的尺寸
    CGSize titleSize = [title sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:self.titleLabel.font,NSFontAttributeName, nil]];
    
    //计算按钮的宽度(文字的宽度+图标的宽度)
    self.width = titleSize.width +self.height;
}
@end
