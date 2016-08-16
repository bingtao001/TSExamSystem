//
//  TaskManagerViewController.m
//  TSExamSystem
//
//  Created by huxingwang on 16/8/12.
//  Copyright © 2016年 huxingwang. All rights reserved.
//

#import "TaskManagerViewController.h"
#import "TaskDetailViewController.h"
#import "Macro.h"
@interface TaskManagerViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tabelView;
@end

@implementation TaskManagerViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configView];
}

- (void)configView{
    self.tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 80)];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    self.tabelView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tabelView];
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tabelView.tableFooterView = footerView;
    self.tabelView.contentInset = UIEdgeInsetsMake(0, 20, 0, -20);
    self.view.backgroundColor = [UIColor colorWithRed:236/255.0 green:235.0/255 blue:235.0/255 alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -UITabelViewDelegete Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"TaskCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    UITextView *contentText = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 50, 280)];
    contentText.text = @"student_id:-1,name:大娃,photo:default/-1.jpg,grade:2012,campus:草场门,college:教师教学发展中心,major:计算机,class:信息一班student_id:-5,name:五娃,photo:default/-5.jpg,grade:2012,campus:草场门,college:教师教学发展中心,major:计算机,class:信息一班";
    contentText.font = [UIFont systemFontOfSize:18];
//    contentText.editable = NO;
    contentText.userInteractionEnabled = NO;
    [cell.contentView addSubview:contentText];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了%ld 行", (long)indexPath.section);
    self.hidesBottomBarWhenPushed = YES;
    TaskDetailViewController *taskVC = [[TaskDetailViewController alloc] init];
    [self.navigationController pushViewController:taskVC animated:NO];
    self.hidesBottomBarWhenPushed = NO;
}

@end
