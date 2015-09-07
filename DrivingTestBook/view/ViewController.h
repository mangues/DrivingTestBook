//
//  ViewController.h
//  DrivingTestBook
//
//  Created by TTS on 15/8/27.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectCarView.h"

@interface ViewController : UIViewController{
    SelectCarView * _selectCarView;
}

@property (weak, nonatomic) IBOutlet UIButton *carView;

@end

