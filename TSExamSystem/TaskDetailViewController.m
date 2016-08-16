//
//  TaskDetailViewController.m
//  TSExamSystem
//
//  Created by huxingwang on 16/8/12.
//  Copyright © 2016年 huxingwang. All rights reserved.
//

#import "TaskDetailViewController.h"
#import "Macro.h"
@interface TaskDetailViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tabelView;
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
    self.tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 75, ScreenWidth - 300 , ScreenHeight - 80)];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    [self.view addSubview:self.tabelView];
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tabelView.tableFooterView = footerView;
    self.view.backgroundColor = [UIColor whiteColor];
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
        cell.backgroundColor = [UIColor darkGrayColor];
    }
    cell.textLabel.text = @"hello";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了%ld 行", (long)indexPath.row);
    //    TaskManagerViewController *taskVC = [[TaskManagerViewController alloc] init];
    //    [self.navigationController pushViewController:taskVC animated:YES];
}
@end
