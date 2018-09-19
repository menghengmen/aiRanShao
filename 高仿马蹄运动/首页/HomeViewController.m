//
//  HomeViewController.m
//  高仿马蹄运动
//
//  Created by 哈哈 on 2018/9/19.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "HomeViewController.h"
#import "ChooseCategoryView.h"
@interface HomeViewController ()
@property (nonatomic,strong) ChooseCategoryView  *categoryView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)chooseChannel:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
