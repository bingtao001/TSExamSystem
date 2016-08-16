//
//  MonitorExamViewController.m
//  TSExamSystem
//
//  Created by huxingwang on 16/8/16.
//  Copyright © 2016年 huxingwang. All rights reserved.
//

#import "MonitorExamViewController.h"
#import "Macro.h"
#import <Masonry/Masonry.h>

@interface MonitorExamViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *totalStudentNum;//总人数
@property (nonatomic, strong) UILabel *signedNum;//已签到人数
@property (nonatomic, strong) UILabel *commitedNum;//已交卷人数
@end

@implementation MonitorExamViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self configView];
}

- (void)configView{
    UIView *topLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 700)];
    topLeftView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topLeftView];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 200, 650) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [topLeftView addSubview:self.tableView];
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = footerView;
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 650, 200, 50)];
    [addBtn setTitle:@"+" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    addBtn.layer.borderWidth = 2;
    addBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [topLeftView addSubview:addBtn];
    
    UIView *topRightView = [[UIView alloc] initWithFrame:CGRectMake(202, 0, ScreenWidth- 200, 700)];
    topRightView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:topRightView];
    UIButton *headImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [headImageBtn setTitle:@"+" forState:UIControlStateNormal];
    headImageBtn.backgroundColor = [UIColor lightGrayColor];
    [topRightView addSubview:headImageBtn];
    [headImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.mas_equalTo(140);
        make.left.mas_equalTo(70);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(200);
    }];
    UILabel *headImage = [[UILabel alloc] init];
    headImage.text = @"头像";
    headImage.textColor = [UIColor redColor];
    headImage.font = [UIFont systemFontOfSize:18];
    headImage.textAlignment = NSTextAlignmentCenter;
    [topRightView addSubview:headImage];
    [headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(headImageBtn.mas_bottom).with.offset(15);
        make.centerX.equalTo(headImageBtn.mas_centerX);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    UIButton *signBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [signBtn setTitle:@"+" forState:UIControlStateNormal];
    [topRightView addSubview:signBtn];
    signBtn.backgroundColor = [UIColor lightGrayColor];
    [signBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(headImageBtn.mas_centerY);
        make.right.mas_equalTo(-70);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(200);
    }];
    UILabel *sign = [[UILabel alloc] init];
    sign.text = @"签到";
    sign.textColor = [UIColor redColor];
    sign.font = [UIFont systemFontOfSize:18];
    sign.textAlignment = NSTextAlignmentCenter;
    [topRightView addSubview:sign];
    [sign mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(headImageBtn.mas_bottom).with.offset(15);
        make.centerX.equalTo(signBtn.mas_centerX);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    
    UIScrollView *papersView = [[UIScrollView alloc] init];
    papersView.backgroundColor = [UIColor lightGrayColor];
    [topRightView addSubview:papersView];
    [papersView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(headImage.mas_bottom).with.offset(20);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(160);
    }];
    
    
    UIButton *collectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [collectBtn setTitle:@"答案采集" forState:UIControlStateNormal];
    [topRightView addSubview:collectBtn];
    collectBtn.layer.cornerRadius = 5;
    [collectBtn setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
    collectBtn.backgroundColor = [UIColor blueColor];
    [collectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-40);
        make.left.mas_equalTo(90);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(50);
    }];
    UIButton *commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [commitBtn setTitle:@"交卷" forState:UIControlStateNormal];
    [topRightView addSubview:commitBtn];
    commitBtn.layer.cornerRadius = 5;
    [commitBtn setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
    commitBtn.backgroundColor = [UIColor blueColor];
    [commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-40);
        make.right.mas_equalTo(-90);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(50);
    }];
    
    
    UIScrollView *totalPapers = [[UIScrollView alloc] init];
    totalPapers.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:totalPapers];
    [totalPapers mas_makeConstraints:^(MASConstraintMaker *make) {
        make.topMargin.equalTo(topLeftView.mas_bottom).with.offset(4);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottomMargin.mas_equalTo(80);
    }];
    
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 80)];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottomMargin.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(80);
    }];
    _totalStudentNum = [[UILabel alloc] init];
    _totalStudentNum.text = @"总人数：57";
    [bottomView addSubview:_totalStudentNum];
    [_totalStudentNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(150);
        make.centerY.equalTo(bottomView.mas_centerY);
    }];
    _signedNum = [[UILabel alloc] init];
    _signedNum.text = @"已签到：57";
    [bottomView addSubview:_signedNum];
    [_signedNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(150);
        make.center.equalTo(bottomView);
    }];
    _commitedNum = [[UILabel alloc] init];
    _commitedNum.text = @"已交卷：57";
    [bottomView addSubview:_commitedNum];
    [_commitedNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.width.mas_equalTo(150);
        make.centerY.equalTo(bottomView.mas_centerY);
    }];

    
    self.view.backgroundColor = [UIColor colorWithRed:236.0/255 green:235.0/255 blue:235.0/255 alpha:1];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = @"21993983295";
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.detailTextLabel.text = @"张三";
    cell.detailTextLabel.font = [UIFont systemFontOfSize:18];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了%ld 行", (long)indexPath.row);
}

@end
