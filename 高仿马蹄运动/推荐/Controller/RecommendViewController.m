//
//  RecommendViewController.m
//  高仿马蹄运动
//
//  Created by 哈哈 on 2018/10/23.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "RecommendViewController.h"
#import "HomeVideoCell.h"
#import "RecommendModel.h"

@interface RecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation RecommendViewController
{
    NSInteger _indexPage;
    
}
-(NSMutableArray*)dataArray{
    if (!_dataArray) {
        _dataArray  = [NSMutableArray new];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUi];
    _indexPage = 1;
    [self getHomeVideoData:1];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dataArray removeAllObjects];
        _indexPage =1;
        [self getHomeVideoData:_indexPage];
    }];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
    
    // 下拉加载
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        _indexPage++;
//        [self getHomeVideoData:_indexPage];
//    } ];
    
}
-(void)setUpUi{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString  * idStr = @"HomeVideoCell";
    HomeVideoCell * cell = [tableView dequeueReusableCellWithIdentifier:idStr ];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeVideoCell" owner:self options:nil] lastObject];
        
    }
    cell.model = self.dataArray[indexPath.row];
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(void)getHomeVideoData:(NSInteger)page{
    [self.dataArray removeAllObjects];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RecommendData" ofType:@"plist"];
    NSArray *data = [NSArray arrayWithContentsOfFile:path];
    for (int i =0 ; i <data.count; i ++) {
        RecommendModel *MODEL = [RecommendModel mj_objectWithKeyValues:(NSDictionary*)data[i]];
        [self.dataArray addObject:MODEL];
    }
    [self.tableView.mj_header endRefreshing];

    [self.tableView reloadData];
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
