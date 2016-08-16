//
//  TaskGetViewController.m
//  TSExamSystem
//
//  Created by huxingwang on 16/8/13.
//  Copyright © 2016年 huxingwang. All rights reserved.
//

#import "TaskGetViewController.h"
#import "TaskManagerViewController.h"
@interface TaskGetViewController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) UIButton *getTaskBtn;

@end

@implementation TaskGetViewController

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (void)viewDidLoad{
    self.view.backgroundColor = [UIColor whiteColor];
    [self showGetTaskBtn];
}

- (void)showGetTaskBtn{
    for (id item in self.view.subviews) {
        [item removeFromSuperview];
    }
    self.getTaskBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [_getTaskBtn setTitle:@"获取任务" forState:UIControlStateNormal];
    _getTaskBtn.frame = CGRectMake(0, 0, 200, 200);
    _getTaskBtn.center = self.view.center;
    _getTaskBtn.backgroundColor = [UIColor greenColor];
    _getTaskBtn.layer.cornerRadius = 85;
    [self.view addSubview:_getTaskBtn];
    [_getTaskBtn addTarget:self action:@selector(getTask) forControlEvents:UIControlEventTouchDown];
}

- (void)getTask{
//    从网络获取任务相关信息
//    [self.navigationController popViewControllerAnimated:NO];
    self.tabBarController.selectedIndex = 1;
    NSNotification *notification = [NSNotification notificationWithName:@"GetTaskSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}



@end
