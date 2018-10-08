//
//  ChooseCategoryViewController.m
//  
//
//  Created by 哈哈 on 2018/9/22.
//

#import "ChooseCategoryViewController.h"
#import "ChooseCategoryView.h"
@interface ChooseCategoryViewController ()

@end

@implementation ChooseCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"视频",@"导购",@"新闻",@"技术",nil];
    
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"音乐",@"影视",@"旅游",@"南京",@"互联网",@"综艺",@"社会",@"农人",@"游戏",@"美食",@"宠物",nil];
    ChooseCategoryView *view = [[ChooseCategoryView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT) choosedCategoryArr:array otherCategory:array1];
    [self.view addSubview:view];
}
- (IBAction)dismiss:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
