//
//  NSString+Extension.h
//  正则表达式
//
//  Created by junFung on 15/6/18.
//  Copyright (c) 2015年 ljf. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (BOOL)match:(NSString *)pattern
{
    //1.创建正则表达式
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    
    //2.测试字符串
    NSArray *results = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    
    return results.count > 0;
}

- (BOOL)isQQ
{
    // 1.不能以0开头
    // 2.全部是数字
    // 3.5-11位
    return [self match:@"^[1-9]\\d{4-10}$"];
}

- (BOOL)isPhoneNumber
{
    // 1.全部是数字
    // 2.11位
    // 3.以13、15、17、18开头
    return [self match:@"^1[3578]\\d{9}$"];
}

//邮箱
- (BOOL)isEmail
{
    return [self match:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
}

- (BOOL)isIPAddress
{
    //1-3个数字，0-255
    //1-3个数字，1-3个数字，1-3个数字，1-3个数字
    return [self match:@"((([1-9]?|1\\d)\\d|2([0-4]\\d|5[0-5]))\\.){3}(([1-9]?|1\\d)\\d|2([0-4]\\d|5[0-5]))"];
}
@end
