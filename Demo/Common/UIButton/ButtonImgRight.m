//
//  ButtonImgRight.m
//  HuoMao
//
//  Created by 李俊峰 on 16/4/11.
//  Copyright © 2016年 woo. All rights reserved.
//

#import "ButtonImgRight.h"

@implementation ButtonImgRight


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //内部图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //字体
        self.titleLabel.font = [UIFont systemFontOfSize:15.0f] ;
        //高亮的时候不需要调整内部的图片为灰色
        self.adjustsImageWhenHighlighted = NO;
        
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.imageView.backgroundColor = [UIColor clearColor];
    }
    return self ;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageX = self.width/2.0+5;
    CGFloat imageY = 0;
    CGFloat imageW = self.width/2.0-5;
    CGFloat imageH = self.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleW = self.width/2.0+5;
    CGFloat titleH = self.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}


@end
