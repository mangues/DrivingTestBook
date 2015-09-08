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
#import "AnswerModel.h"
@implementation MyDataManager
+(NSArray*)getData:(DataType)type{
    switch (type) {
        case chapter:
        {
            NSString *sql = @"select pid,pname,pcount from firstlevel";
            NSArray *array =[[KCDbManager sharedKCDbManager] executeQuery:sql];
            Array_NSDictionary2Model(TestSelectModel)
            return  arr;
        }
            break;
        case answer:
        {
            NSString *sql = @"select mquestion,mdesc,mid,manswer,mimage,pid,pname,sid,sname,mtype from leaflevel";
            NSArray *array =[[KCDbManager sharedKCDbManager] executeQuery:sql];
            Array_NSDictionary2Model(AnswerModel)
            return  arr;
        }
            break;
        default:
            break;
    }
    return nil;
}
@end
