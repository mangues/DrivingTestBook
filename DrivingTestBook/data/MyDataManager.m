//
//  MyDataManager.m
//  DrivingTestBook
//
//  Created by TTS on 15/9/6.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "MyDataManager.h"
#import "KCDbManager.h"
#import "TestSelectModel.h"

@implementation MyDataManager
+(NSArray*)getData:(DataType)type{
    switch (type) {
        case chapter:
        {
            NSString *sql = @"select pid,pname,pcount from firstlevel";
            NSArray *array =[[KCDbManager sharedKCDbManager] executeQuery:sql];
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                TestSelectModel *model = [[TestSelectModel alloc]init];
                [model setValuesForKeysWithDictionary:(NSDictionary*)obj];
                [arr addObject:model];
            }];
            return  arr;
        }
            break;
        default:
            break;
    }
    return nil;
}
@end
