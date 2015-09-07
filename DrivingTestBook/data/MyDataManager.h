//
//  MyDataManager.h
//  DrivingTestBook
//
//  Created by TTS on 15/9/6.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum{
    chapter   //章节练习数据
}DataType;
@interface MyDataManager : NSObject
+(NSArray*)getData:(DataType)type;
@end
