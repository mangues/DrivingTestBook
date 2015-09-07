//
//  AnswerTableViewCell.h
//  DrivingTestBook
//
//  Created by TTS on 15/9/6.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imagetrue;
@property (weak, nonatomic) IBOutlet UILabel *contentAn;

@end
