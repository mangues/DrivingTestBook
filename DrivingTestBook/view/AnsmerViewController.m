//
//  AnsmerViewController.m
//  DrivingTestBook
//
//  Created by TTS on 15/9/6.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "AnsmerViewController.h"
#import "AnswerScrollView.h"

@interface AnsmerViewController ()

@end

@implementation AnsmerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *array = @[@"1",@"2",@"3",@"4",@"5"];
    AnswerScrollView *view = [[AnswerScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) anddataArray:array];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
