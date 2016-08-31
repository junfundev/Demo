//
//  BaseModel.h
//  Demo
//
//  Created by admin on 16/8/30.
//  Copyright © 2016年 hm. All rights reserved.
//

#import <Foundation/Foundation.h>

#define __string(__k__)             @property (nonatomic ,copy)   NSString            *__k__
#define __array(__k__)              @property (nonatomic ,strong) NSArray             *__k__
#define __mutableArray(__k__)       @property (nonatomic ,strong) NSMutableArray      *__k__
#define __dictionary(__k__)         @property (nonatomic ,strong) NSDictionary        *__k__
#define __mutableDictionary(__k__)  @property (nonatomic ,strong) NSMutableDictionary *__k__
#define __int(__k__)                @property (nonatomic ,assign) int                 __k__
#define __interger(__k__)           @property (nonatomic ,assign) NSInteger           __k__
#define __float(__k__)              @property (nonatomic ,assign) CGFloat             __k__
#define __cgsize(__k__)             @property (nonatomic ,assign) CGSize              __k__
#define __bool(__k__)               @property (nonatomic ,assign) BOOL                __k__
#define __cgrect(__k__)             @property (nonatomic ,assign) CGRect              __k__

@interface BaseModel : NSObject

@end
