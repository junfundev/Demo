//
//  CoreDataManager.h
//  News
//
//  Created by junFung on 15/11/4.
//  Copyright © 2015年 yc. All rights reserved.
//  CoreDataManager管理类

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void(^complete)(NSArray *array,NSError *error);

@interface CoreDataManager : NSObject
/** 类方法创建管理者实例*/
+ (instancetype)manager;

/** 初始化数据库*/
+ (void)initCoreDataBaseWithFileName:(NSString *)fileName;

/** 上下文*/
@property (nonatomic, strong) NSManagedObjectContext *context;

#warning --- 往数据库插入一个对象首先要将这个实体类和模型文件关联起来 ---
/**
 *   将实体类和模型文件建立联系
 *   @param class 传入一个你要操作的实体类的类名
 *   @return 返回一 NSManagedObject的对象
 */
+ (id)insertNewObjectForEntityForName:(Class)modelClass;

/** 查询语句 （通过block回调）*/
+ (void)executeFetchRequest:(Class)entityClass predicate:(NSPredicate *)predicate complete:(complete)complete;

/** 查询语句（返回一个数组）*/
+ (NSArray *)executeFetchRequest:(Class)entityClass predicate:(NSPredicate *)predicate error:(NSError **)error;

#pragma mark --- 保存上下文 ---
/**
 *   用来保存上下文
 *   @return 是否保存成功
 */
+ (BOOL)save:(NSError **)error;
/**
 *   删除对象
 */
+ (void)deleteObject:(NSManagedObject *)object;

@end