//
//  HomeVideoCell.h
//  麻花影视
//
//  Created by 哈哈 on 2018/9/15.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"

@protocol  videoClickDelegate<NSObject>
-(void)videoClickWith:(RecommendModel*)model;
@end

@interface HomeVideoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *destritionLabel;
@property (strong, nonatomic) IBOutlet UIButton *videoCoverBtn;
@property (strong, nonatomic) IBOutlet UIButton *shareBtn;
@property (strong, nonatomic) IBOutlet UILabel *viewCountLabel;
@property (strong, nonatomic) IBOutlet UIButton *commentBtn;
@property (strong, nonatomic) IBOutlet UIButton *praiseBtn;
@property   (nonatomic,strong)   RecommendModel *model;

@property (weak,nonatomic) id<videoClickDelegate>delegate;
@end
