//
//  MoveCell.m
//  高仿马蹄运动
//
//  Created by 哈哈 on 2018/9/21.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "MoveCell.h"

@implementation MoveCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    
    return self;
}

-(void)setUpUI{
    UILabel *v = [[UILabel alloc] initWithFrame:self.bounds];
    [self addSubview:v];
    v.backgroundColor = [UIColor clearColor];
    v.textColor = RGB(175, 180, 186);
    v.font = [UIFont systemFontOfSize:13];
    v.textAlignment = NSTextAlignmentCenter;
    v.userInteractionEnabled = YES;
    self.titleLabel = v;
    self.moveCellIsMoving = NO;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(moveCell:touchesBegan:withEvent:)]) {
        [self.delegate moveCell:self touchesBegan:touches withEvent:event];
    }
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(moveCell:touchesMove:withEvent:)]) {
        [self.delegate moveCell:self touchesMove:touches withEvent:event];
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(moveCell:touchesEnd:withEvent:)]) {
        [self.delegate moveCell:self touchesEnd:touches withEvent:event];
    }
    self.moveCellIsMoving = NO;
}

@end
