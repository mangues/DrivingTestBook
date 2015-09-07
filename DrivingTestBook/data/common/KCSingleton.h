//
//  KCSingleton.h
//  WeiBo
//
//  Created by Kenshin Cui on 14-4-12.
//  Copyright (c) 2014年 Kenshin Cui. All rights reserved.
//
//单例

#ifndef KCSingleton_h
#define KCSingleton_h

#pragma mark 接口.h中的定义
//由于宏定义里有需要替换的内容所以定义一个变量className
//##用于分割、连接字符串
#define singleton_interface(className) +(className *)shared##className;

#pragma mark 实现.m
//\在代码中用于连接宏定义,以实现多行定义
#define singleton_implementation(className) \
static className *_instance;\
+(id)shared##className{\
    if(!_instance){\
        _instance=[[self alloc]init];\
    }\
    return _instance;\
}\
+(id)allocWithZone:(struct _NSZone *)zone{\
    static dispatch_once_t dispatchOnce;\
    dispatch_once(&dispatchOnce, ^{\
        _instance=[super allocWithZone:zone];\
    });\
    return _instance;\
}

#endif
