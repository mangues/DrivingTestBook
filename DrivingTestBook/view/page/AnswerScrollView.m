//
//  AnswerScrollView.m
//  DrivingTestBook
//
//  Created by TTS on 15/9/6.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "AnswerScrollView.h"
#import "AnswerTableViewCell.h"
#define SIZE self.frame.size
@interface AnswerScrollView()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    
}
@end
@implementation AnswerScrollView{
    UIScrollView *_scrollView;
    UITableView *_leftTableView;
    UITableView *_centerTableView;
    UITableView *_rightTableView;
    NSArray *_dataArray;
}

-(instancetype)initWithFrame:(CGRect)frame anddataArray:(NSArray *)array{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArray = array;
        _scrollView = [[UIScrollView alloc]initWithFrame:frame];
        _scrollView.delegate = self;
        _leftTableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        _centerTableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        _rightTableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStyleGrouped];
        
        _leftTableView.delegate = self;
        _centerTableView.delegate = self;
        _rightTableView.delegate = self;
        
        _leftTableView.dataSource = self;
        _centerTableView.dataSource = self;
        _rightTableView.dataSource = self;
        
        
        _leftTableView.scrollEnabled = NO;
        _centerTableView.scrollEnabled = NO;
        _rightTableView.scrollEnabled = NO;

        
        
        
        
        //设置分页
        _scrollView.pagingEnabled = YES;
        //默认为YES，用来设置scrollView的弹簧效果
        _scrollView.bounces = NO;
        if (_dataArray.count>1) {    //超过一题需要滑动
            _scrollView.contentSize = CGSizeMake(SIZE.width*2, 0);
        }
        [self createView];
    }
    return self;
    
}

- (void)createView{
     _leftTableView.frame = CGRectMake(0, 0, SIZE.width, SIZE.height);
     _centerTableView.frame = CGRectMake(SIZE.width, 0, SIZE.width, SIZE.height);
     _rightTableView.frame = CGRectMake(SIZE.width*2, 0, SIZE.width, SIZE.height);
    [_scrollView addSubview:_leftTableView];
    [_scrollView addSubview:_centerTableView];
    [_scrollView addSubview:_rightTableView];
    [self addSubview:_scrollView];
}

#pragma mark 实现table的代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZE.width, 100)];
    view.backgroundColor = [UIColor redColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier=@"AnswerTableViewCell";
    AnswerTableViewCell *cell;
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        cell= [[[NSBundle mainBundle] loadNibNamed: cellIdentifier owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;  //选中风格
        cell.numberLabel.layer.masksToBounds = YES;   //设置圆角
        cell.numberLabel.layer.cornerRadius = 10;
    }
    cell.numberLabel.text = [NSString stringWithFormat:@"%c",(char)('A'+indexPath.row)];
    return cell;
}

/**
 *  @author mangues, 15-09-06 19:09:16
 *
 *  滚动结束,不停的往后添加tableView
 *
 *  @param scrollView 
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint currentOffset = scrollView.contentOffset;
    int page = (int)currentOffset.x/SIZE.width;//滑动到了第几页
    if (page<_dataArray.count - 1) {
        _scrollView.contentSize = CGSizeMake(currentOffset.x+SIZE.width*2, 0);
        _centerTableView.frame = CGRectMake(currentOffset.x, 0, SIZE.width, SIZE.height);
        _leftTableView.frame = CGRectMake(currentOffset.x - SIZE.width, 0, SIZE.width, SIZE.height);
        _rightTableView.frame = CGRectMake(currentOffset.x + SIZE.width, 0, SIZE.width, SIZE.height);
    }
    
}
@end
