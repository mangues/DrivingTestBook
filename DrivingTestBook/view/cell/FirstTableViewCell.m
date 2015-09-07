//
//  FirstTableViewCell.m
//  DrivingTestBook
//
//  Created by TTS on 15/8/28.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "FirstTableViewCell.h"

@implementation FirstTableViewCell
/**
 *  @author mangues, 15-08-28 13:08:13
 *
 *  类初始化方法
 */
- (void)awakeFromNib {

}


/**
 *  @author mangues, 15-08-28 13:08:28
 *
 *  数据设置方法
 *
 */

- (void)setModel:(FirstTableCellModel *)model{
    _firstTableCellImage.image = [UIImage imageNamed: model.imageUrl];
    _firstTableCellLabel.text = model.cellName;
}

#pragma mark 重写选择事件，取消选中
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
