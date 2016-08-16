//
//  AdiminViewController.m
//  TSExamSystem
//
//  Created by huxingwang on 16/8/16.
//  Copyright © 2016年 huxingwang. All rights reserved.
//

#import "AdiminViewController.h"
#import <Masonry/Masonry.h>
#import "Macro.h"

@implementation AdiminViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self configView];
}

- (void)configView{
    CGFloat topMargin = 50;
    UILabel *deviceLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, topMargin, 80, 40)];
    deviceLabel.text = @"设备号";
    [self.view addSubview: deviceLabel];
    
    topMargin += 60;
    UILabel *deviceNum = [[UILabel alloc] initWithFrame:CGRectMake(160, topMargin, 180, 60)];
    deviceNum.text = @"001";
    [self.view addSubview: deviceNum];
    UIButton *updateDeviceBtn = [[UIButton alloc] initWithFrame:CGRectMake(300, topMargin, 100, 40)];
    [updateDeviceBtn setTitle:@"更新设备号" forState:UIControlStateNormal];
    [updateDeviceBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:updateDeviceBtn];
    
    
    topMargin += 150;
    UILabel *managerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, topMargin, 180, 40)];
    managerLabel.text = @"管理员账号";
    [self.view addSubview: managerLabel];
    topMargin += 50;
    UILabel *managerName = [[UILabel alloc] initWithFrame:CGRectMake(160, topMargin, 180, 60)];
    managerName.text = @"用户名";
    [self.view addSubview: managerName];
    UITextView *managerNameTextView = [[UITextView alloc] initWithFrame:CGRectMake(360, topMargin, 180, 60)];
    managerNameTextView.text = @"Admin";
    [self.view addSubview: managerNameTextView];
    topMargin += 30;
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, topMargin, 180, 60)];
    passwordLabel.text = @"密码";
    [self.view addSubview: passwordLabel];
    UILabel *passwordTextView = [[UILabel alloc] initWithFrame:CGRectMake(360, topMargin, 180, 60)];
    passwordTextView.text = @"*******";
    [self.view addSubview: passwordTextView];
    topMargin += 200;
    UIButton *uploadingBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, topMargin, 500, 60)];
    [uploadingBtn setTitle:@"上传所有监考考场的试卷" forState:UIControlStateNormal];
    [uploadingBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    uploadingBtn.titleLabel.font = [UIFont systemFontOfSize:28];
    [self.view addSubview:uploadingBtn];
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
