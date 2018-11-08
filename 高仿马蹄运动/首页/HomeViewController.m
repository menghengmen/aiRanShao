//
//  HomeViewController.m
//  高仿马蹄运动
//
//  Created by 哈哈 on 2018/9/19.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "HomeViewController.h"
#import "ChooseCategoryViewController.h"
#import "MHCommentView.h"
@interface HomeViewController ()
{
    MHCommentView *view;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    view = [[MHCommentView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, 0)];
    [self.view addSubview:view];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)show:(UIButton *)sender {
    [view show];
}
- (IBAction)chooseChannel:(id)sender {
    [self presentViewController:[ChooseCategoryViewController new] animated:YES completion:nil];
    
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
