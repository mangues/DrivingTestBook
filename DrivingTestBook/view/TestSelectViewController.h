//
//  TestSelectViewController.h
//  DrivingTestBook
//
//  Created by TTS on 15/9/1.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestSelectViewController : UIViewController
@property (nonatomic,copy)NSString *myTitle;  //导航栏标题
@property (nonatomic,copy)NSArray *dataArray; //数据源接口
@end
