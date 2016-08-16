//
//  MonitorHomeViewController.m
//  TSExamSystem
//
//  Created by huxingwang on 16/8/16.
//  Copyright © 2016年 huxingwang. All rights reserved.
//

#import "MonitorHomeViewController.h"
#import "MonitorExamViewController.h"
#import "Macro.h"

@interface MonitorHomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation MonitorHomeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self configView];
}

- (void)configView{
    self.title = @"监考场次";
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Identifier"];
    self.view.backgroundColor = [UIColor colorWithRed:236.0/255 green:235.0/255 blue:235.0/255 alpha:1];
}

#pragma mark -UICollectionViewDelegateMethods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(ScreenWidth - 40, 300);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Identifier" forIndexPath:indexPath];
    UITextView *contentText = [[UITextView alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth - 60, 280)];
    contentText.text = @"student_id:-1,name:大娃,photo:default/-1.jpg,grade:2012,campus:草场门,college:教师教学发展中心,major:计算机,class:信息一班student_id:-5,name:五娃,photo:default/-5.jpg,grade:2012,campus:草场门,college:教师教学发展中心,major:计算机,class:信息一班";
    contentText.font = [UIFont systemFontOfSize:20];
    contentText.editable = NO;
    contentText.userInteractionEnabled = NO;
    [cell addSubview:contentText];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MonitorExamViewController *examVC = [[MonitorExamViewController alloc] init];
    [self.navigationController pushViewController:examVC animated:YES];
}

@end
