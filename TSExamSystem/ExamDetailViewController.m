//
//  ExamDetailViewController.m
//  TSExamSystem
//
//  Created by huxingwang on 16/8/16.
//  Copyright © 2016年 huxingwang. All rights reserved.
//

#import "ExamDetailViewController.h"
#import "Macro.h"
#import <Masonry/Masonry.h>

@interface ExamDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tabelView;
@property (nonatomic, strong) UILabel *examName;//考试名称
@property (nonatomic, strong) UILabel *semester;//学期
@property (nonatomic, strong) UILabel *subject; //科目
@property (nonatomic, strong) UILabel *examOrder;//场次
@property (nonatomic, strong) UILabel *studentsCount;// 人数；
@property (nonatomic, strong) UILabel *teacher;//监考老师
@property (nonatomic, strong) UILabel *startTime; //开始时间
@property (nonatomic, strong) UILabel *endTime;//结束时间

@end

@implementation ExamDetailViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
}

- (void)configView{
    self.title = @"考场详情";
    UIView *topTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth - 150, 100)];
    [self.view addSubview:topTitleView];
    CGFloat topMargin = 5;
    _examName = [[UILabel alloc] initWithFrame:CGRectMake(5, topMargin, 150, 20)];
    _examName.text = @"2016年5月师范生技能考核";
    [topTitleView addSubview:_examName];
    [_examName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(5);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(20);
        make.height.mas_equalTo(30);
    }];
    topMargin += 30;
    _semester = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 20)];
    _semester.text = @"学期：2016春季";
    [topTitleView addSubview:_semester];
    [_semester mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(topMargin);
        make.leftMargin.mas_equalTo(95);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    _subject = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 250, 20)];
    _subject.text = @"科目：钢笔字";
    [topTitleView addSubview:_subject];
    [_subject mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(_semester.mas_topMargin);
        make.leftMargin.equalTo(_semester.mas_right).with.offset(80);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(20);
    }];
    _examOrder = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 20)];
    _examOrder.text = @"场次：教4  401第一场";
    [topTitleView addSubview:_examOrder];
    [_examOrder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(_semester.mas_bottom).with.offset(10);
        make.left.mas_equalTo(35);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(20);
    }];
    _studentsCount = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 20)];
    _studentsCount.text = @"人数：57";
    [topTitleView addSubview:_studentsCount];
    [_studentsCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(_examOrder.mas_topMargin);
        make.left.equalTo(_examOrder.mas_right).with.offset(5);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];
    
    _teacher = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 20)];
    _teacher.text = @"监考老师：袁玉龙";
    [topTitleView addSubview:_teacher];
    [_teacher mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(_examOrder.mas_topMargin);
        make.left.equalTo(_studentsCount.mas_right).with.offset(5);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(20);
    }];

    _startTime = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 20)];
    _startTime.text = @"开始：2016-05-18  13：30";
    [topTitleView addSubview:_startTime];
    [_startTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(_examOrder.mas_bottom).with.offset(10);
        make.left.mas_equalTo(35);
        make.width.mas_equalTo(270);
        make.height.mas_equalTo(20);
    }];

    _endTime = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 150, 20)];
    _endTime.text = @"人数：57";
    [topTitleView addSubview:_endTime];
    [_endTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(_startTime.mas_topMargin);
        make.right.mas_equalTo(35);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(20);
    }];
    
    UILabel *headView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 150, 30)];
    headView.text = @"校区         学院         专业         年级         班级         学号         姓名         座位号";
    [topTitleView addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(_startTime.mas_bottom).with.offset(10);
        make.right.mas_equalTo(5);
        make.left.mas_equalTo(5);
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
    NSArray *nameArr = @[@"启用", @"不启用", @"袁玉龙", @"刘洋"];
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
    
    
    
    
    self.tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth - 150 , ScreenHeight - 170)];
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
            NSLog(@"启动");
            break;
        case 1:
            NSLog(@"不启动");
            break;
        case 2:
            NSLog(@"袁玉龙");
            break;
        case 3:
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
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"StudentCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = @"草场门      计算机     计算应用       大二    计1601    09         张三           01";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了%ld 行", (long)indexPath.row);
}

@end
