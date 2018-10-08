//
//  MoveCell.h
//  高仿马蹄运动
//
//  Created by 哈哈 on 2018/9/21.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MoveCell;
@protocol MoveCellDelegate <NSObject>

@optional
-(void)moveCell:(MoveCell*)moveCell touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

-(void)moveCell:(MoveCell*)moveCell touchesEnd:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

-(void)moveCell:(MoveCell*)moveCell touchesMove:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

@end


@interface MoveCell : UIView

@property(nonatomic,weak)  id<MoveCellDelegate>delegate;
@property(nonatomic,strong)  UILabel *titleLabel;
@property(nonatomic,assign)  BOOL moveCellIsMoving; //是否正在移动;
@property(nonatomic,strong)  NSIndexPath *position; //记录cell 的位置信息
@property(nonatomic,assign)  NSInteger destinationPositon;///记录cell的移动终点
@end

