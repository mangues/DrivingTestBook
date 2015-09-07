//
//  SelectCarView.m
//  DrivingTestBook
//
//  Created by TTS on 15/8/28.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "SelectCarView.h"

@implementation SelectCarView
-(instancetype)initWithFrame:(CGRect)frame andButton:(UIButton *)btn{
    __button = btn;
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        [self createBtn];
    }
    return self;
}

-(void)createBtn{
    for (int i=0; i<4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.frame = CGRectMake(self.frame.size.width/4 * i+self.frame.size.width/4/2-30, self.frame.size.height-80, 60,60);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i+1]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }];
}

-(void)click:(UIButton *)btn{
    //button 的每个状态 都可以 附一个 图片  ,backgroundImageForState----根据状态获取 图片
    [__button setImage:[btn backgroundImageForState:UIControlStateNormal] forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    }];
}
@end
