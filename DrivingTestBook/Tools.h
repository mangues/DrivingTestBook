//
//  Tools.h
//  DrivingTestBook
//
//  Created by TTS on 15/9/7.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Tools : NSObject
+ (NSArray*)getAnswerWithString:(NSString*)str;
+ (CGSize)getSizeWithString:(NSString *)str withFont:(UIFont *)font withSize:(CGSize)size;
@end
