//
//  FirstTableViewCell.h
//  DrivingTestBook
//
//  Created by TTS on 15/8/28.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstTableCellModel.h"

@interface FirstTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *firstTableCellImage;
@property (weak, nonatomic) IBOutlet UILabel *firstTableCellLabel;
@property (nonatomic,strong) FirstTableCellModel *model;
@end
