//
//  Define.h
//  Demo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 hm. All rights reserved.
//

#ifndef Define_h
#define Define_h

/*safe release*/
//#undef HM_RELEASE_SAFELY
#define HM_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF)) \
{\
__REF = nil;\
}\
}

//view安全释放
#define HMVIEW_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF))\
{\
[__REF removeFromSuperview];\
__REF = nil;\
}\
}

//释放定时器
#define HM_INVALIDATE_TIMER(__TIMER) \
{\
[__TIMER invalidate];\
__TIMER = nil;\
}

//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) count] == 0))

//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) isEqualToString:@""]))

/**
 *  存入永久存储对象
 *
 *  @param object 要存储的对象
 *  @param key    对应的key
 */
#define DEF_SET(object,key)\
({\
NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];\
[defaults setObject:object forKey:key];\
[defaults synchronize];\
})

/**
 *  取出永久存储对象
 *
 *  @param key 存储对象的key
 *
 *  @return key对应的object
 */

#define DEF_GET(key)\
({\
NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];\
[defaults objectForKey:key];\
})

/**
 *  移除存储对象
 *
 *  @param key 存储对象的key
 *
 *  @return key对应的object
 */

#define DEF_REMOVE(key)\
({\
NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];\
[defaults removeObjectForKey:key];\
})

/**
 *  十六进制字符串转UIColor
 *
 *  @param rgbValue 无#十六进制字符串
 *
 *  @return UIColor对象
 */
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


//----------------------ABOUT IMAGE 图片 ----------------------------

//LOAD LOCAL IMAGE FILE     读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]


//DEFINE IMAGE      定义UIImage对象//    imgView.image = IMAGE(@"Default.png");

#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//DEFINE IMAGE      定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]

//BETTER USER THE FIRST TWO WAY, IT PERFORM WELL. 优先使用前两种宏定义,性能高于后面.


#endif /* Define_h */
