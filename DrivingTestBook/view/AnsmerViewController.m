//
//  AnsmerViewController.m
//  DrivingTestBook
//
//  Created by TTS on 15/9/6.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "AnsmerViewController.h"
#import "AnswerScrollView.h"
#import "MyDataManager.h"
#import "AnswerModel.h"

@interface AnsmerViewController ()

@end

@implementation AnsmerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *array = [MyDataManager getData:answer];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        AnswerModel *model = (AnswerModel*)obj;
        if ([model.pid intValue]==_number+1) {
            [arr addObject:model];
        }
    }];
    
    AnswerScrollView *view = [[AnswerScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) anddataArray:arr];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
