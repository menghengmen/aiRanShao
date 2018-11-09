//
//  MHCommentView.m
//  高仿马蹄运动
//
//  Created by 哈哈 on 2018/11/8.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "MHCommentView.h"

@interface MHCommentView()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UIView *backGroundView;


@end

@implementation MHCommentView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUpUi];
    }
    return  self;
}

-(UIView*)backGroundView{
    
    if (!_backGroundView) {
        _backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, 0)];
        _backGroundView.backgroundColor = [UIColor blackColor];
        _backGroundView.alpha = 0.5;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [_backGroundView addGestureRecognizer:tap];
    }
    
    return _backGroundView;
}




-(NSMutableArray*)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        _dataArray = [[NSMutableArray alloc] initWithObjects:@"疯狂的少年能发上动脑筋妇女节十多年方式对你分内的事你附近十多年减肥呢圣诞节发",@"dsd kns jnjnfdnwnekfmlkwen",@"adskn sj njsn jsndjnfjdsnjfnjsndfsdnjfnsdjfndnfdnmndgmfdngmndfmngmdfnmngmfdnmgnmdfnmgnmfndmd" ,nil];
     

    }
    return _dataArray;
}

-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 400, self.frame.size.width, 400)];
        _tableView.delegate =self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.tableFooterView = [UIView new];
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    }
    return _tableView;
    
}



-(void)setUpUi{
    [self addSubview:self.backGroundView];
    [self addSubview:self.tableView];
}

-(void)show{
    [UIView animateWithDuration:0.5  animations:^{
        self.backGroundView.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);

        self.frame = CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT);

    }];
    
}

-(void)dismiss{
    [UIView animateWithDuration:0.5 animations:^{
        self.backGroundView.frame = CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, 0);
        
        self.frame = CGRectMake(0, SCREENHEIGHT, SCREENWIDTH, 0);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


#pragma  mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.numberOfLines = 0;
    return cell;
}

@end
