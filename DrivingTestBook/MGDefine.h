//
//  MGDefine.h
//  DrivingTestBook
//
//  Created by TTS on 15/9/7.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#ifndef DrivingTestBook_MGDefine_h
#define DrivingTestBook_MGDefine_h

/**
 *  @author mangues, 15-09-07 11:09:12
 *
 *  用于数据库中 array中的字典转化为对应的对象
 *
 *  @return
 */
#define Array_NSDictionary2Model(modelName) \
NSMutableArray *arr = [[NSMutableArray alloc] init];\
[array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {\
modelName *model = [[modelName alloc]init];\
[model setValuesForKeysWithDictionary:(NSDictionary*)obj];\
[arr addObject:model];\
}];
#endif
