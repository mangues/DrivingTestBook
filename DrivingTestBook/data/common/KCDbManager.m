//
//  KCDbManager.m
//  SQLiteDemo
//
//  Created by TTS on 15/8/13.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "KCDbManager.h"
#import <sqlite3.h>


#ifndef kDatabaseName

#define kDatabaseName @"myDatabase.db"

#endif

@interface KCDbManager()
@end
@implementation KCDbManager

singleton_implementation(KCDbManager)

#pragma mark 重写初始化方法
-(instancetype)init{
    KCDbManager *manager;
    if((manager=[super init]))
    {
        [manager openDb:kDatabaseName];
    }
    return manager;
}

-(void)openDb:(NSString *)dbname{
    //取得数据库保存路径，通常保存沙盒Documents目录
//    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
//    NSLog(@"%@",directory);
//    NSString *filePath=[directory stringByAppendingPathComponent:dbname];
 
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"sqlite"];
     NSLog(@"%@",path);
    //创建FMdatabaseQueue对象
    self.database = [FMDatabaseQueue databaseQueueWithPath:path];
    
    
}

-(void)executeNonQuery:(NSString *)sql{

    //执行更新sql语句，用于插入，更新，删除
    [self.database inDatabase:^(FMDatabase *db) {
        [db executeQuery:sql];
    }];
}

-(NSArray *)executeQuery:(NSString *)sql{
    NSMutableArray *array = [NSMutableArray array];
    [self.database inDatabase:^(FMDatabase *db) {
        //执行查询sql语句
        FMResultSet *result = [db executeQuery:sql];
        while (result.next) {
            NSMutableDictionary *dir = [NSMutableDictionary dictionary];
            for (int i=0; i<result.columnCount; i++) {
                dir[[result columnNameForIndex:i]]=[result stringForColumnIndex:i];
            }
            [array addObject:dir];

        }
    }];
    return array;
    
    
}


@end
