//
//  CoreDataManager.m
//  News
//
//  Created by junFung on 15/11/4.
//  Copyright © 2015年 yc. All rights reserved.
//

#import "CoreDataManager.h"

@implementation CoreDataManager

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static CoreDataManager *_manager;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        _manager = [super allocWithZone:zone];
    });
    return _manager;
}

+ (instancetype)manager
{
    return [[super alloc] init];
}

+ (void)initCoreDataBaseWithFileName:(NSString *)fileName
{
     // 1.上下文 关联Company.xcdatamodeld 模型文件
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    //关联模型文件
    //创建一个模型对象
    //传一个nil、会把bundle下所有模型文件关联起来
    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    //持久化调度器
    NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    //数据库的名字
    NSError *error = nil;
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *file = [NSString stringWithFormat:@"%@.sqlite",fileName];
    //数据库的路径
    NSString *sqlitePath = [path stringByAppendingPathComponent:file];
    NSLog(@"sqlitePath=%@",sqlitePath);
    
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:sqlitePath] options:nil error:&error];
    context.persistentStoreCoordinator = store;
    
    CoreDataManager *manager = [self manager];
    manager.context = context;
}

+ (id)insertNewObjectForEntityForName:(Class)modelClass
{
    CoreDataManager *manager = [CoreDataManager manager];
    NSManagedObject *obj = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(modelClass) inManagedObjectContext:manager.context];
    return obj;
}
/**
 *   查询语句
 *
 *   @param entityClass 实体类的类名
 *   @param sql         查询语句
 *   @param error       &error
 *
 *   @return 返回查询结果的数组
 */
+ (NSArray*)executeFetchRequest:(Class)entityClass predicate:(NSPredicate *)predicate error:(NSError**)error
{
    CoreDataManager *manager = [CoreDataManager manager];
    //创建一个请求对象 （填入要查询的表名-实体类）
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass(entityClass)];
    request.predicate = predicate;
    NSArray *emps = [manager.context executeFetchRequest:request error:error];
    return emps;
}

+ (void)executeFetchRequest:(Class)entityClass predicate:(NSPredicate *)predicate complete:(complete)complete
{
    CoreDataManager *manager = [CoreDataManager manager];
    //创建一个请求对象 （填入要查询的表名-实体类）
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:NSStringFromClass(entityClass)];
    request.predicate = predicate;
    NSError *error = nil;
    NSArray *emps = [manager.context executeFetchRequest:request error:&error];
    if (complete)
    {
        complete(emps,error);
    }
}

+ (BOOL)save:(NSError **)error
{
    CoreDataManager *manager = [CoreDataManager manager];
    BOOL s = [manager.context save:error];
    if (s) {
        NSLog(@"保存成功");
    }
    return s;
}

+ (void)deleteObject:(NSManagedObject *)object
{
    CoreDataManager *manager = [CoreDataManager manager];
    [manager.context deleteObject:object];
    
    NSError *error = nil;
    [manager.context save:&error];
}
@end