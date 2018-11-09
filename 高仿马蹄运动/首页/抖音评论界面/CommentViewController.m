//
//  CommentViewController.m
//  高仿马蹄运动
//
//  Created by 哈哈 on 2018/11/9.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "CommentViewController.h"
#import "MHCommentView.h"
@interface CommentViewController ()
{
    MHCommentView *view;
}
@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)show:(UIButton *)sender {
    view = [[MHCommentView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, 0)];
    [self.view addSubview:view];
    [view show];
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
