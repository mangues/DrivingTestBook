//
//  TestSelectViewController.m
//  DrivingTestBook
//
//  Created by TTS on 15/9/1.
//  Copyright (c) 2015年 TTS. All rights reserved.
//

#import "TestSelectViewController.h"
#import "TestSelectTableViewCell.h"
#import "TestSelectModel.h"
#import "MyDataManager.h"
#import "AnsmerViewController.h"
@interface TestSelectViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView* _tableView;
    NSArray * _array;
}

@end

@implementation TestSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //加载数据源
    [self initData];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;   //取消导航栏影响
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//创建tableView
-(void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

//加载数据
-(void)initData{
     _array = [MyDataManager getData:chapter];
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

/**
 *  @author mangues, 15-08-28 13:08:51
 *
 *  生成cell
 *
 *  @param tableView
 *  @param indexPath
 *
 *  @return
 */

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"TestSelectTableViewCell";
    TestSelectTableViewCell *cell;
    cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(!cell){
        //        cell=[[FirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        //利用xib生成的cell
        cell= [[[NSBundle mainBundle] loadNibNamed: cellIdentifier owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;  //选中风格
        cell.numberLabel.layer.masksToBounds = YES;   //设置圆角
        cell.numberLabel.layer.cornerRadius = 8;
    }
    TestSelectModel *model = _array[indexPath.row];
    cell.numberLabel.text = model.pid;
    cell.contentLabel.text = model.pname;
    return cell;
}



/**
 *  @author mangues, 15-09-01 11:09:05
 *
 *  使得底边线左右对齐
 */
-(void)viewDidLayoutSubviews
{
    if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [_tableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_tableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
/**
 *  @author mangues, 15-09-06 19:09:05
 *
 *  点击
 *
 *  @param tableView
 *  @param indexPath
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[[AnsmerViewController alloc]init] animated:YES];
}


@end
