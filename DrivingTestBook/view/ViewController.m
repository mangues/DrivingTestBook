//
//  ViewController.m
//  DrivingTestBook
//
//  Created by TTS on 15/8/27.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "MyDataManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _selectCarView = [[SelectCarView alloc] initWithFrame:self.view.frame andButton:_carView];
    [self.view addSubview:_selectCarView];
    _selectCarView.alpha = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click:(id)sender {
    UIButton *btn = (UIButton *)sender;
    UIStoryboard *secondStoryboard;
    secondStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    UIViewController *firstVC = [secondStoryboard instantiateViewControllerWithIdentifier:@"tableView"];
    switch (btn.tag) {
        case 101:
            [self.navigationController pushViewController:[[FirstViewController alloc] init] animated:true];
            break;
        case 102:
            
            [self.navigationController pushViewController:firstVC animated:YES];
            break;
        case 103:
            
            break;
        case 104:
            
            break;
        case 105:
            
            break;
        case 106:
            
            break;
        case 110:
            [UIView animateWithDuration:0.3 animations:^{
                _selectCarView.alpha = 0.7;
            }];
            
            break;

    }
    
    
    
}

@end
