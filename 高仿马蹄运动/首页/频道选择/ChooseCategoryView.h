//
//  ChooseCategoryView.h
//  高仿马蹄运动
//
//  Created by 哈哈 on 2018/9/19.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseCategoryView : UIView

@property (nonatomic,assign) CGFloat leftMargin; //左边距
@property (nonatomic,assign) CGFloat topMargin;///垂直边距
@property (nonatomic,assign) CGFloat twoCellMargin; //cell之间的水平距离
@property (nonatomic,assign) CGFloat cellBorthWidth;///cell的边框宽度
@property (nonatomic,assign) CGFloat moveCellWidth;///cell的宽度
@property (nonatomic,assign) CGFloat moveCellheigth;///cell的高度

@property (nonatomic , strong) NSMutableArray *currentChoiceChannels;//当前已经选择的频道
@property (nonatomic , strong) NSMutableArray *otherChnnels;//当前还没有进行选择的频道

-(instancetype)initWithFrame:(CGRect)frame choosedCategoryArr:(NSMutableArray*)arr  otherCategory:(NSMutableArray*)unChhoosedArr;

@end
