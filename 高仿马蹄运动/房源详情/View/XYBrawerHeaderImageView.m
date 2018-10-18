//
//  XYBrawerHeaderImageView.m
//  XiongDaJinFu
//
//  Created by 哈哈 on 2018/10/18.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "XYBrawerHeaderImageView.h"
@interface XYBrawerHeaderImageView()
@property (nonatomic,strong)UIImageView *imageView;
@end
@implementation XYBrawerHeaderImageView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
////     Drawing code
//    [super drawRect:rect];
//}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = [UIColor colorWithRandomColor];
        self.contentMode =UIViewContentModeScaleAspectFill;
        self.clipsToBounds =YES;
        self.userInteractionEnabled = true;
        
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width/2.0f - 40, self.frame.size.height/2.0f - 40, 80, 80)];
        self.imageView = imageview;
        imageview.image = [UIImage imageNamed:@"boFang"];
        [self addSubview:imageview];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)setModel:(XYImageModel *)model{
    _model = model;
    self.url = model.url;
    self.isPlayer = model.isVideo;
}

-(void)tap:(UITapGestureRecognizer *)tap{
    if (self.imageClickBlock) {
        self.imageClickBlock();
    }
}

-(void)setIsPlayer:(XYPhonesType)isPlayer{
    _isPlayer = isPlayer;
    if (isPlayer == XYPhonesTypeFullVideos || isPlayer == XYPhonesTypeFullImage) {
        self.imageView.hidden = false;
    }else{
        self.imageView.hidden = true;
    }
}
///本demo暂时用的本地的本地的图片,网络的图片用sd设置即可
-(void)setUrl:(NSString *)url{
    _url = url;
   // [self sd_setImageWithURL:[NSURL URLWithString:url]];
    self.image = [UIImage imageNamed:url];
}

@end
