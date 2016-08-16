//
//  LoginViewController.m
//  TSExamSystem
//
//  Created by huxingwang on 16/8/9.
//  Copyright © 2016年 huxingwang. All rights reserved.
//

#import "LoginViewController.h"
#import <Masonry/Masonry.h>
#import "Macro.h"
#import "MonitorHomeViewController.h"
#import "TaskGetViewController.h"
#import "TaskManagerViewController.h"
#import "TaskDetailViewController.h"
#import "UserManagerViewController.h"
#import "AdiminViewController.h"
@interface LoginViewController ()

@property (nonatomic, strong) UITextView *channelTextView;
@property (nonatomic, strong) UITextView *userNameTextView;
@property (nonatomic, strong) UITextView *passwordTextView;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, copy) NSMutableArray *myArr;

@property (nonatomic, copy) NSString *copStr;
@property (nonatomic, strong) NSString *strongStr;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configView];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.view.backgroundColor = [UIColor colorWithRed:91/255.0 green:227.0/255 blue:174.0/255 alpha:1];
}

- (void)configView{
    
    UIImageView *logoImage = [[UIImageView alloc] init];
    logoImage.backgroundColor = [UIColor redColor];
    [self.view addSubview:logoImage];
    [logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(ScreenHeight*1.0/5.0);
        make.left.equalTo(self.view).with.offset(ScreenWidth/3.0);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(250);
    }];
    
//    title
    UILabel *title = [[UILabel alloc] init];
    title.text = @"Be a better teacher";
    title.textAlignment = NSTextAlignmentCenter;
    title.font = [UIFont systemFontOfSize:24];
    [self.view addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(ScreenHeight*1.0/5.0);
        make.left.equalTo(self.view).with.offset(ScreenWidth/3.0);
        make.right.equalTo(self.view).with.offset(-30);
        make.height.mas_equalTo(65);
    }];
    
    UIView *middleView = [[UIView alloc] init];
    middleView.backgroundColor = [UIColor colorWithRed:155/255.0 green:230.0/255 blue:199.0/255 alpha:1];
    [self.view addSubview:middleView];
    [middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(ScreenHeight*2.0/5.0);
        make.left.equalTo(self.view).with.offset(ScreenWidth/3.0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(250);
    }];
    
    UILabel *channelLabel = [[UILabel alloc] init];
    channelLabel.text = @"频道:";
    channelLabel.textAlignment = NSTextAlignmentCenter;
    channelLabel.font = [UIFont systemFontOfSize:24];
    [middleView addSubview:channelLabel];
    [channelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(middleView).with.offset(10);
        make.left.equalTo(middleView).with.offset(20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(80);
    }];
    
    self.channelTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 80, 50) textContainer:nil];
    self.channelTextView.text = @"123";
    self.channelTextView.font = [UIFont systemFontOfSize:17];
    self.channelTextView.backgroundColor = [UIColor clearColor];
    
    [middleView addSubview:self.channelTextView];
    [self.channelTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(middleView).with.offset(10);
        make.left.equalTo(channelLabel.mas_right).with.offset(20);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(180);

    }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"用户名:";
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:24];
    [middleView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(channelLabel.mas_bottom).with.offset(30);
        make.left.equalTo(middleView).with.offset(30);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(80);
    }];
    
    self.userNameTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 80, 50) textContainer:nil];
    self.userNameTextView.text = @"张三";
    self.userNameTextView.font = [UIFont systemFontOfSize:17];
    [middleView addSubview:self.userNameTextView];
    [self.userNameTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(channelLabel.mas_bottom).with.offset(30);
        make.left.equalTo(nameLabel.mas_right).with.offset(30);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(180);
        
    }];

    
    UILabel *passwordLabel = [[UILabel alloc] init];
    passwordLabel.text = @"密码:";
    passwordLabel.textAlignment = NSTextAlignmentCenter;
    passwordLabel.font = [UIFont systemFontOfSize:24];
    [middleView addSubview:passwordLabel];
    [passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).with.offset(30);
        make.left.equalTo(middleView).with.offset(30);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(80);
    }];
    
    self.userNameTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 80, 50) textContainer:nil];
    self.userNameTextView.text = @"******";
    self.userNameTextView.font = [UIFont systemFontOfSize:17];
    [middleView addSubview:self.userNameTextView];
    [self.userNameTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nameLabel.mas_bottom).with.offset(30);
        make.left.equalTo(nameLabel.mas_right).with.offset(30);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(180);
    }];
    
    
    self.loginBtn = [[UIButton alloc] init];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    self.loginBtn.backgroundColor = [UIColor colorWithRed:183.0/255 green:232.0/255 blue:210.0/255 alpha:1];
    [self.loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [middleView addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(45);
    }];
    
    [self.loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *collegeName = [[UILabel alloc] init];
    collegeName.text = @"江苏第二师范学院 \n 教师教学发展中心";
    collegeName.textAlignment = NSTextAlignmentCenter;
    collegeName.font = [UIFont systemFontOfSize:24];
    collegeName.numberOfLines = 2;
    [self.view addSubview:collegeName];
    [collegeName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-40);
        make.height.mas_equalTo(80);
    }];
}

- (void)login{
    
    MonitorHomeViewController *monitorVC = [[MonitorHomeViewController alloc] init];
    [self.navigationController pushViewController:monitorVC animated:YES];
    return;
    
    TaskGetViewController *taskGetVC = [[TaskGetViewController alloc] init];
    taskGetVC.tabBarItem.title = @"获取任务";
    TaskManagerViewController *taskManagerVC = [[TaskManagerViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:taskManagerVC];
    nav.tabBarItem.title = @"任务管理";
    UserManagerViewController *userManagerVC = [[UserManagerViewController alloc] init];
    userManagerVC.tabBarItem.title = @"用户管理";
    AdiminViewController *adiminVC = [[AdiminViewController alloc] init];
    adiminVC.tabBarItem.title = @"Adimin";
    UITabBarController *tabBar = [[UITabBarController alloc] init];
    tabBar.viewControllers = @[taskGetVC, nav, userManagerVC, adiminVC];
    tabBar.view.backgroundColor = [UIColor greenColor];
    [[UIApplication sharedApplication].delegate window] .rootViewController = tabBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
