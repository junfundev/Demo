//
//  UIImage+Extension.m
//  黑马微博
//
//  Created by apple on 14-7-3.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)imageWithNoRenderingImageNamed:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    return image;
}

@end
