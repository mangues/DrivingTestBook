//
//  AnswerScrollView.h
//  DrivingTestBook
//
//  Created by TTS on 15/9/6.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerScrollView : UIView
-(instancetype)initWithFrame:(CGRect)frame anddataArray:(NSArray*)array;
@property (nonatomic,assign,readonly) int currentPage;
@end
