//
//  SelectCarView.h
//  DrivingTestBook
//
//  Created by TTS on 15/8/28.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectCarView : UIView
-(instancetype)initWithFrame:(CGRect)frame andButton:(UIButton *)btn;
@property (nonatomic,strong) UIButton * _button;
@end
