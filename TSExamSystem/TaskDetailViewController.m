//
//  TaskDetailViewController.m
//  TSExamSystem
//
//  Created by huxingwang on 16/8/12.
//  Copyright © 2016年 huxingwang. All rights reserved.
//

#import "TaskDetailViewController.h"
#import "Macro.h"
#import <Masonry/Masonry.h>
#import "ExamDetailViewController.h"
@interface TaskDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tabelView;
@property (nonatomic, strong) UILabel *taskNum;
@property (nonatomic, strong) UILabel *channelNum;
@property (nonatomic, strong) UILabel *examName;
@property (nonatomic, strong) UILabel *examCount;
@property (nonatomic, strong) UILabel *address;

@end

@implementation TaskDetailViewController
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
}

- (void)configView{
    self.title = @"任务详情";
    
    UIView *topTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth - 150, 75)];
    [self.view addSubview:topTitleView];
    _taskNum= [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 20)];
    _taskNum.text = @"任务编号：20161070101_1";
    [topTitleView addSubview:_taskNum];
    [_taskNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(5);
        make.left.mas_equalTo(5);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    _channelNum= [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 20)];
    _channelNum.text = @"频道：1";
    [topTitleView addSubview:_channelNum];
    [_channelNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(5);
        make.right.mas_equalTo(5);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    _examName = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 250, 20)];
    _examName.text = @"任务编号：20161070101_1";
    [topTitleView addSubview:_examName];
    [_examName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(topTitleView);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(30);
    }];
    _examCount = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 20)];
    _examCount.text = @"场次数量：4";
    [topTitleView addSubview:_examCount];
    [_examCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(5);
        make.left.mas_equalTo(5);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    _address = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 20)];
    _address.text = @"校区：草场门";
    [topTitleView addSubview:_address];
    [_address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(5);
        make.right.mas_equalTo(5);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    
    UIView *btnsView = [[UIView alloc] init];
    [self.view addSubview:btnsView];
    [btnsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(400);
    }];
    NSArray *nameArr = @[@"全部启用", @"全不启用", @"启用", @"不启用", @"袁玉龙", @"刘洋"];
    for (int i = 0; i < nameArr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:nameArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btnsView addSubview:btn];
        __block CGFloat topMargin = 10;
        __block CGFloat btnHeight = 50;
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo((topMargin + btnHeight)* i);
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(btnHeight);
        }];
    }
    
    
    self.tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 145, ScreenWidth - 150 , ScreenHeight - 145)];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tabelView];
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tabelView.tableFooterView = footerView;
    self.view.backgroundColor = [UIColor colorWithRed:236.0/255 green:235.0/255 blue:235.0/255 alpha:1];
}

- (void)btnClick:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
            NSLog(@"全部启动");
            break;
        case 1:
            NSLog(@"全不启动");
            break;
        case 2:
            NSLog(@"启动");
            break;
        case 3:
            NSLog(@"不启动");
            break;
        case 4:
            NSLog(@"袁玉龙");
            break;
        case 5:
            NSLog(@"刘洋");
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UITabelViewDelegete Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"TaskCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    UIView *taskView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, ScreenWidth - 200, 280)];
    taskView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:taskView];
    cell.textLabel.text = @"hello";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了%ld 行", (long)indexPath.row);
    ExamDetailViewController *examVC = [[ExamDetailViewController alloc] init];
    [self.navigationController pushViewController:examVC animated:YES];
}
@end
