//
//  HomeVideoCell.m
//  麻花影视
//
//  Created by 哈哈 on 2018/9/15.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "HomeVideoCell.h"
#import <SDWebImage/UIButton+WebCache.h>

@implementation HomeVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)playVideo:(id)sender {
    if (self.delegate &&[self.delegate respondsToSelector:@selector(videoClickWith:)]) {
        [self.delegate videoClickWith:self.model];

    }


}

-(void)setModel:(RecommendModel *)model{
    _model = model;
  //  [self.iconImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImgBaseUrl,model.avatar]]];
    ///本地图片
    self.iconImage.image = [UIImage imageNamed:model.avatar];
    self.nameLabel.text = model.name;
    self.timeLabel.text = model.createTimeStr;
    self.destritionLabel.text = model.descriptionStr;
   //[self.videoCoverBtn sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ImgBaseUrl2,model.videoCover]] forState:UIControlStateNormal];
    ///本地
    [self.videoCoverBtn setImage:[UIImage imageNamed:model.videoCover] forState:UIControlStateNormal];
    [self.videoCoverBtn.imageView setContentMode:UIViewContentModeScaleAspectFill];

    self.viewCountLabel.text = [NSString stringWithFormat:@"%@次播放",model.viewCount];
    [self.shareBtn setTitle:model.shareTimes forState:UIControlStateNormal];
    [self.commentBtn setTitle:model.videoCommentTimes forState:UIControlStateNormal];
    [self.praiseBtn setTitle:model.totalGoodNums forState:UIControlStateNormal];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
