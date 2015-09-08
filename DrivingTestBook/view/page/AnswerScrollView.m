//
//  AnswerScrollView.m
//  DrivingTestBook
//
//  Created by TTS on 15/9/6.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "AnswerScrollView.h"
#import "AnswerTableViewCell.h"
#import "AnswerModel.h"
#import "Tools.h"
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
        _currentPage = 1;
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
/**
 *  @author mangues, 15-09-08 16:09:38
 *
 *  自动头部高度
 *
 *  @param tableView
 *  @param section
 *
 *  @return
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height = [[[self getHeightHeaderInSection:tableView] lastObject] floatValue];
    return height;
}
/**
 *  @author mangues, 15-09-08 17:09:46
 *
 *  头部 题目问题
 *
 *  @param tableView <#tableView description#>
 *  @param section
 *
 *  @return
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat height = [[[self getHeightHeaderInSection:tableView] lastObject] floatValue];
    NSString *str = (NSString*)[[self getHeightHeaderInSection:tableView] firstObject];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZE.width, height)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, tableView.frame.size.width-20, height-20)];
    label.text = [NSString stringWithFormat:@"%d,%@",[self getPageInt:tableView andCurrentPage:_currentPage],str];
    label.font = [UIFont systemFontOfSize:16];
    label.numberOfLines = 0;
    [view addSubview:label];
    return view;
}

/**
 *  @author mangues, 15-09-08 17:09:22
 *
 *  底部高度
 *
 *  @param tableView
 *  @param section
 *
 *  @return
 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    AnswerModel *model = [self getAnswerModel:tableView];
    UIFont *font = [UIFont systemFontOfSize:(CGFloat)16];
    NSString *str = [NSString stringWithFormat:@"答案解析：%@", model.mdesc];
    
    CGFloat height = [Tools getSizeWithString:str withFont:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;

    return height;
}

/**
 *  @author mangues, 15-09-08 17:09:06
 *
 *  底部view
 *
 *  @param tableView
 *  @param section
 *
 *  @return
 */

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    AnswerModel *model = [self getAnswerModel:tableView];
    UIFont *font = [UIFont systemFontOfSize:(CGFloat)16];
    NSString *str = [NSString stringWithFormat:@"答案解析：%@", model.mdesc];
    CGFloat height = [Tools getSizeWithString:str withFont:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SIZE.width, height)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, tableView.frame.size.width-20, height-20)];
    label.text = str;
    label.font = [UIFont systemFontOfSize:16];
    label.numberOfLines = 0;
    view.backgroundColor = [UIColor greenColor];
    [view addSubview:label];
    return view;
}




/**
 *  @author mangues, 15-09-08 17:09:04
 *
 *  table 的cell
 *
 *  @param tableView
 *  @param indexPath
 *
 *  @return
 */
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
    
    AnswerModel *model = [self getAnswerModel:tableView];
    if ([model.mtype intValue]==1) {
        cell.contentAn.text = [[Tools getAnswerWithString:model.mquestion] objectAtIndex:indexPath.row+1];
    }
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
    if (page<_dataArray.count - 1&&page>0) {
        _scrollView.contentSize = CGSizeMake(currentOffset.x+SIZE.width*2, 0);
        _centerTableView.frame = CGRectMake(currentOffset.x, 0, SIZE.width, SIZE.height);
        _leftTableView.frame = CGRectMake(currentOffset.x - SIZE.width, 0, SIZE.width, SIZE.height);
        _rightTableView.frame = CGRectMake(currentOffset.x + SIZE.width, 0, SIZE.width, SIZE.height);
    }
    _currentPage = page;
    [self reloadData];   //重新加载数据
}

/**
 *  @author mangues, 15-09-08 15:09:41
 *
 *  刷新tableview
 */
-(void)reloadData{
    [_leftTableView reloadData];
    [_centerTableView reloadData];
    [_rightTableView reloadData];
}


/**
 *  @author mangues, 15-09-08 16:09:04
 *
 *  获取合适的model
 *
 *  @param tableView
 *
 *  @return
 */
- (AnswerModel *)getAnswerModel:(UITableView*) tableView{
    AnswerModel *model= [[AnswerModel alloc]init];
    if (tableView==_leftTableView&&_currentPage==0) { //第一页
        model = _dataArray[_currentPage];
    }else if(tableView==_leftTableView&&_currentPage>0){
        model = _dataArray[_currentPage-1];
    }else if (tableView==_centerTableView&&_currentPage==0) {
        model = _dataArray[_currentPage+1];
    }else if(tableView==_centerTableView&&_currentPage>0&&_currentPage<_dataArray.count-1){
        model = _dataArray[_currentPage];
    }else if (tableView==_centerTableView&&_currentPage==_dataArray.count-1) {
        model = _dataArray[_currentPage-1];
    }else if(tableView==_rightTableView&&_currentPage==_dataArray.count-1){
        model = _dataArray[_currentPage];
    }else if(tableView==_rightTableView&&_currentPage<_dataArray.count-1){
        model = _dataArray[_currentPage+1];
    }
    return model;

}



- (int)getPageInt:(UITableView *)tableView andCurrentPage:(int)page{
    if (tableView==_leftTableView&&page==0) { //第一页
        return 1;
    }else if(tableView==_leftTableView&&page>0){
        return page;

    }else if (tableView==_centerTableView&&page==0) {
        return 2;

    }else if(tableView==_centerTableView&&page>0&&page<_dataArray.count-1){
        return page+1;

    }else if (tableView==_centerTableView&&page==_dataArray.count-1) {
        return page;
    }else if(tableView==_rightTableView&&page==_dataArray.count-1){
        return page+2;

    }else if(tableView==_rightTableView&&page<_dataArray.count-1){
        return page+1;
    }
    
    return 0;

}

/**
 *  @author mangues, 15-09-08 16:09:29
 *
 *  根据 text 获取label的高度
 *
 *  @param tableView
 *
 *  @return
 */
-(NSArray*)getHeightHeaderInSection:(UITableView*)tableView{
    AnswerModel *model = [self getAnswerModel:tableView];
    UIFont *font = [UIFont systemFontOfSize:(CGFloat)16];
    NSString *str;
    if([model.mtype intValue] == 1){//选择题
        str = [[Tools getAnswerWithString:model.mquestion] objectAtIndex:0];
        
    }else{
        str = model.mquestion;
    }
    
    CGFloat height = [Tools getSizeWithString:str withFont:font withSize:CGSizeMake(tableView.frame.size.width-20, 400)].height+20;
    if (height<80) {
        height = 80;
    }
    
    NSString *hei = [NSString stringWithFormat:@"%f",height];
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:str,hei,nil];
    return array;
}




@end
