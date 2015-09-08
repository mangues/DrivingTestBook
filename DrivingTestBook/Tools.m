//
//  Tools.m
//  DrivingTestBook
//
//  Created by TTS on 15/9/7.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "Tools.h"

@implementation Tools
/**
 *  @author mangues, 15-09-07 12:09:05
 *
 *  处理 题目 答案，数据库里是一起放在一起的
 *
 *  @param str 题目+答案字符串
 *
 *  @return 题目，答案区分开的array
 */
+ (NSArray*)getAnswerWithString:(NSString *)str{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSArray *arr = [str componentsSeparatedByString:@"<BR>"];
    [array addObject:arr[0]];
     for(int i=0;i<4;i++){
         [array addObject:[arr[i+1] substringFromIndex:2]];   //去除A,B,C,D
     }
          return array;
}
/**
 *  @author mangues, 15-09-08 16:09:49
 *
 *  //根据要显示的text计算label高度
 *
 *  @param str
 *  @param font
 *  @param size
 *
 *  @return     
 */
+ (CGSize)getSizeWithString:(NSString *)str withFont:(UIFont *)font withSize:(CGSize)size{
    //UIFont *font = [UIFont fontWithName:@"Arial" size:11];//11 一定要跟label的显示字体大小一致
    
    //设置字体
    
    //CGSize size = CGSizeMake(300, 20000.0f);//注：这个宽：300 是你要显示的宽度既固定的宽度，高度可以依照自己的需求而定
    CGSize newsize ;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)//IOS 7.0 以上
        
    {
        
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
        
        newsize =[str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
        
    }
    else
    {
        newsize = [str sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];//ios7以上已经摒弃的这个方法
        
    }
    return newsize;
}
@end
