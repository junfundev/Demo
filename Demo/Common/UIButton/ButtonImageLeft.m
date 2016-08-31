//
//  ButtonImageLeft.m
//  MainHM
//
//  Created by 李俊峰 on 16/2/13.
//  Copyright © 2016年 hm. All rights reserved.
//

#import "ButtonImageLeft.h"

@implementation ButtonImageLeft


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //内部图标居中
        self.imageView.contentMode = UIViewContentModeRight ;
        self.titleLabel.textAlignment = NSTextAlignmentLeft ;
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
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
    CGFloat imageX = 0;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

/**
 *  设置内部文字的frame
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = self.height;
    CGFloat titleH = self.height;
    CGFloat titleW = self.width - self.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

- (void)setTitle:(NSString *)title forState:(UIControlState)state 
{
    [super setTitle:title forState:state];
    
    CGSize titleSize = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, self.height) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0]} context:nil].size;
    //计算按钮的宽度(文字的宽度+图标的宽度)
    self.width = titleSize.width +self.height;
}

@end
