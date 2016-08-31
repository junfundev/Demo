//
//  NSString+Extension.h
//  正则表达式
//
//  Created by junFung on 15/6/18.
//  Copyright (c) 2015年 ljf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

- (BOOL)isQQ ;

- (BOOL)isPhoneNumber;

- (BOOL)isEmail ;

- (BOOL)isIPAddress ;
@end
