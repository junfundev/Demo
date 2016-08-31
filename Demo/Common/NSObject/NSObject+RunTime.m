//
//  NSObject+RunTime.m
//  Demo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 hm. All rights reserved.
//

/*
 遍历模型类里面所有的属性名，然后去字典中查找
 1.利用runtime给对象中的成员属性赋值

 */

#import "NSObject+RunTime.h"
#import <objc/message.h>

@implementation NSObject (RunTime)

+ (instancetype)objectWithDic:(NSDictionary *)dic
{
    id obj = [[self alloc] init];
    
    /*
     Ivar:成员属性的意思
     class_copyIvarList:把成员属性列表复制一份给你
     Ivar *:指向Ivar指针，指向一个成员变量数组
     class:获取那个类的成员属性列表
     count:成员属性的总数
     */
    
    // 1.获取成员属性数组
    unsigned int count = 0;
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    for (int i = 0 ; i < count; i ++) {
        // 获取成员属性
        Ivar ivar = ivarList[i];
        
        // 获取成员名
        NSString *propertName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 获取成员属性的类型
//        NSString *propertType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        // 成员属性名都是带下划线的，所以赋值的时候，要进行截取字符串讲下划线去掉作为key
        NSString *key = [propertName substringFromIndex:1];

        id value = dic[key];     

        if (value) {
            [obj setValue:value forKey:key];
        }
    }
    
    
    return obj;
}
@end
