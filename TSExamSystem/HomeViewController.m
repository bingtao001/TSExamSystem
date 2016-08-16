//
//  HomeViewController.m
//  TSExamSystem
//
//  Created by huxingwang on 16/8/12.
//  Copyright © 2016年 huxingwang. All rights reserved.
//

#import "HomeViewController.h"
#import "Macro.h"
#import "TaskGetViewController.h"
#import "TaskManagerViewController.h"
#import "TaskDetailViewController.h"
#import "UserManagerViewController.h"
@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource, GUITabPagerDataSource, GUITabPagerDelegate>
@property (nonatomic, strong) UIButton *getTaskBtn;
@property (nonatomic, strong) UITableView *tabelView;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    [self reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setDataSource:self];
//    [self setDelegate:self];
//    [self selectTabbarIndex:0];
    
    [self configView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getTaskSuccess) name:@"GetTaskSuccess" object:nil];
}

- (void)getTaskSuccess{
    [self selectTabbarIndex:1];
}

- (NSInteger)numberOfViewControllers {
    return 4;
}

- (UIViewController *)viewControllerForIndex:(NSInteger)index {
    TaskGetViewController *taskGetVC = [[TaskGetViewController alloc] init];
    TaskManagerViewController *taskManagerVC = [[TaskManagerViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:taskManagerVC];
    TaskDetailViewController *taskDetailVC =[[TaskDetailViewController alloc] init];
    UserManagerViewController *userManagerVC = [[UserManagerViewController alloc] init];
    NSArray *array = @[taskGetVC, nav, userManagerVC, taskDetailVC];
    return array[index];
}

- (void)tabPager:(GUITabPagerViewController *)tabPager didTransitionToTabAtIndex:(NSInteger)index{

}

- (NSString *)titleForTabAtIndex:(NSInteger)index {
    NSArray *array = @[@"任务获取",@"任务管理",@"用户管理",@"Adimin"];
    return array[index];
}

- (CGFloat)tabHeight {
    // Default: 44.0f
    return 80.0f;
}

- (UIColor *)tabBackgroundColor {
    // Default: [UIColor colorWithWhite:0.95f alpha:1.0f];
    return [UIColor colorWithRed:91/255.0 green:227.0/255 blue:174.0/255 alpha:1];
}

- (UIFont *)titleFont {
    // Default: [UIFont fontWithName:@"HelveticaNeue-Thin" size:20.0f];
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:20.0f];
}

- (UIColor *)titleColor {
    // Default: [UIColor blackColor];
    return [UIColor blackColor];
}


- (void)configView{
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)showGetTaskBtn{
    for (id item in self.contentView.subviews) {
        [item removeFromSuperview];
    }
    self.getTaskBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [_getTaskBtn setTitle:@"获取任务" forState:UIControlStateNormal];
    _getTaskBtn.frame = CGRectMake(0, 0, 200, 200);
    _getTaskBtn.center = self.view.center;
    _getTaskBtn.backgroundColor = [UIColor greenColor];
    _getTaskBtn.layer.cornerRadius = 85;
    [self.contentView addSubview:_getTaskBtn];
    [_getTaskBtn addTarget:self action:@selector(getTask) forControlEvents:UIControlEventTouchDown];
}

- (void)getTask{
    for (id item in self.contentView.subviews) {
        [item removeFromSuperview];
    }
    self.tabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 80)];
    self.tabelView.delegate = self;
    self.tabelView.dataSource = self;
    [self.contentView addSubview:self.tabelView];
    UIView * footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
    footerView.backgroundColor = [UIColor clearColor];
    self.tabelView.tableFooterView = footerView;
}

- (void)showUserManagerView{
    
    UserManagerViewController *userVC = [[UserManagerViewController alloc] init];
    [self.navigationController pushViewController:userVC animated:YES];
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
    }
    cell.textLabel.text = @"hello";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了%ld 行", (long)indexPath.row);
    TaskManagerViewController *taskVC = [[TaskManagerViewController alloc] init];
    [self.navigationController pushViewController:taskVC animated:YES];
}

#pragma mark -HXWScrollTitleViewDelegate Methods
- (void)scrollTitleViewDidSeletedIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            [self showGetTaskBtn];
            break;
        case 1:
            [self getTask];
            break;
        case 2:
            [self showUserManagerView];
            break;
        case 3:
//            [self showGetTaskBtn];
            break;
        default:
            break;
    }
}


@end
