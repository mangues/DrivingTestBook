//
//  Tools.m
//  DrivingTestBook
//
//  Created by TTS on 15/9/7.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "Tools.h"

@implementation Tools
/**
 *  @author mangues, 15-09-07 12:09:05
 *
 *  处理 题目 答案，数据库里是一起放在一起的
 *
 *  @param str 题目+答案字符串
 *
 *  @return 题目，答案区分开的array
 */
+ (NSArray*)getAnswerWithString:(NSString *)str{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSArray *arr = [str componentsSeparatedByString:@"<BR>"];
    [array addObject:arr[0]];
     for(int i=0;i<4;i++){
         [array addObject:[arr[i+1] substringFromIndex:2]];   //去除A,B,C,D
     }
          return array;
}
@end
