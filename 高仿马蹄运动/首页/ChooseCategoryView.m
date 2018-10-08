//
//  ChooseCategoryView.m
//  高仿马蹄运动
//
//  Created by 哈哈 on 2018/9/19.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "ChooseCategoryView.h"
#import "MoveCell.h"

typedef enum :NSUInteger{
    moveCellAnimationTypePanBetweenEachOther = 10,//moveCell动画，在彼此之间相互滑动
    moveCellAnimationTypeJumpToOtherSection = 11,//moveCell动画，调到另外一组
}moveCellAnimationType;


@interface ChooseCategoryView ()<MoveCellDelegate>
@property (nonatomic,strong)  UILabel *titleLab;
@property (nonatomic,strong)  UILabel *moreLabel;//更多频道label
@property (nonatomic,strong)  NSMutableArray *points;
@property (nonatomic,strong)  NSMutableArray *moveCells_sectionOne;
@property (nonatomic,strong)  NSMutableArray *moveCells_sectionTwo;

@end

@implementation ChooseCategoryView

-(NSMutableArray*)moveCells_sectionOne{
    if (!_moveCells_sectionOne) {
        _moveCells_sectionOne = [NSMutableArray new];
    }
    
    return _moveCells_sectionOne;
}

-(NSMutableArray*)moveCells_sectionTwo{
    if (!_moveCells_sectionTwo) {
        _moveCells_sectionTwo = [NSMutableArray new];
    }
    return _moveCells_sectionTwo;
    
}


-(instancetype)initWithFrame:(CGRect)frame choosedCategoryArr:(NSMutableArray *)arr otherCategory:(NSMutableArray *)unChhoosedArr{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        self.currentChoiceChannels = arr;
        self.otherChnnels = unChhoosedArr;
        [self setUpUI];
  
    }
    
    return self;
}

-(void)setUpUI{
    self.cellBorthWidth = 2;
    self.leftMargin = 15;
    self.topMargin = 20;
    self.twoCellMargin = 10;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, self.bounds.size.width, 30)];
    titleLabel.font = [UIFont systemFontOfSize:13];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.text = [NSString stringWithFormat:@"   长按拖动排序/点击删除"];
    self.titleLab = titleLabel;
    [self addSubview:titleLabel];
    
   ///cell的宽度
    CGFloat moveCellW = [self getMoveCellWidth];
    self.moveCellWidth = moveCellW;
    /// cell的高度
    CGFloat moveCellH = moveCellW/2;
    self.moveCellheigth = moveCellH;
  
    /// 推荐

    
    
    /// 设置已选频道
    self.points = [self getCellCenter:self.currentChoiceChannels.count section:0];
    for (int i = 0 ; i < self.points.count; i ++) {
        MoveCell *cell = [self createMoveCell:self.currentChoiceChannels[i]];
        cell.position = [NSIndexPath indexPathForItem:i inSection:0];
        cell.tag = i+1;

        NSValue *pointValue = self.points[i];
        cell.center = [pointValue CGPointValue];
        [self.moveCells_sectionOne addObject:cell];
    }
    
  
    CGFloat moreY = [self.points.lastObject CGPointValue].y;
    /// 点击订阅更多频道
    UILabel *moreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, moreY+moveCellH/2+self.cellBorthWidth +self.topMargin, self.bounds.size.width, 30)];
    moreLabel.font = [UIFont systemFontOfSize:14];
    moreLabel.backgroundColor = RGB(142, 202, 230);
    moreLabel.textColor = [UIColor whiteColor];
    moreLabel.text = [NSString stringWithFormat:@"点击订阅更多频道"];
    moreLabel.textAlignment = NSTextAlignmentCenter;
    self.moreLabel = moreLabel;
    [self addSubview:moreLabel];

   /// 未选择频道
    [self.points addObjectsFromArray:[self getCellCenter:self.otherChnnels.count section:1]];
    NSInteger choiceCount = self.currentChoiceChannels.count;

    for (int i = (int)choiceCount ; i < self.points.count; i ++) {
        NSString *content = [self.otherChnnels objectAtIndex:i-choiceCount];

        MoveCell *cell = [self createMoveCell:content];
        cell.tag = i+1;
        cell.position = [NSIndexPath indexPathForItem:i inSection:1];
        NSValue *pointValue = self.points[i];
        cell.center = [pointValue CGPointValue];
        [self.moveCells_sectionTwo addObject:cell];
    }

}

/// 返回水平方向上modeCell的宽度
-(CGFloat)getMoveCellWidth{
    CGFloat leftRightMargin = 2*self.leftMargin;
    CGFloat middleMargin = (NUMBEROFMOVECELL-1)*self.twoCellMargin + NUMBEROFMOVECELL*2*self.cellBorthWidth;
    return (self.frame.size.width -leftRightMargin -middleMargin)/NUMBEROFMOVECELL;
    
}


-(MoveCell*)createMoveCell:(NSString*)text{
    MoveCell * cell = [[MoveCell alloc] initWithFrame:CGRectMake(0, 0, self.moveCellWidth, self.moveCellheigth)];
    cell.titleLabel.text = text;
    cell.delegate = self;
    cell.backgroundColor = RGB(231, 231, 231);
    [self addSubview:cell];
    return cell;
    
}

-(NSMutableArray*)getCellCenter:(NSInteger)cellCount section:(NSInteger)section{
    NSMutableArray *pointArr = [NSMutableArray new];
    CGFloat moveCellW = [self getMoveCellWidth];
    CGFloat moveCellH = moveCellW/2;
    CGFloat left_Margin = self.cellBorthWidth + self.leftMargin;
    CGFloat moveCellY = 0.0;
    if (section == 0) {
        moveCellY = CGRectGetMaxY(self.titleLab.frame);
    } else{
        moveCellY = CGRectGetMaxY(self.moreLabel.frame);

    }
   
    NSInteger totalSectionCellCount = cellCount;
    
    for (int i = 0 ; i<totalSectionCellCount; i++) {
        CGFloat centerX;
        CGFloat centerY;
        
        /// 行
        NSInteger row = i /NUMBEROFMOVECELL;
        /// 列
        NSInteger col = i %NUMBEROFMOVECELL;
        
        if (col == 0) {
            centerX = left_Margin +0.5*moveCellW;
        } else {
            centerX = left_Margin +(moveCellW + self.twoCellMargin)*col + moveCellW*0.5;
        }
        
        if (row == 0) {
            centerY  = moveCellY +self.topMargin +moveCellH*0.5;
        } else {
            centerY  = moveCellY + self.topMargin +(moveCellH+self.topMargin)*row +moveCellH*0.5;
        }
        NSValue *pointValue =  [NSValue valueWithCGPoint:CGPointMake(centerX, centerY)];
        [pointArr addObject:pointValue];
    
    }
    return pointArr;
}

# pragma mark
# pragma MoveCellDelegate
-(void)moveCell:(MoveCell *)moveCell touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (moveCell.position.section == 1){
        
        //将这个cell移动到第一组中
        return ;
    }
    
    if (event.type == UIEventTypeTouches) {
        for (NSValue *pointValue in self.points) {
            [self bringSubviewToFront:moveCell];
            CGRect rect = moveCell.frame;
            rect.size = CGSizeMake(self.moveCellWidth+5, self.moveCellheigth+5);
            moveCell.frame = rect;
            
            CGPoint point = [pointValue CGPointValue];
            if (CGRectContainsPoint(rect, point)){
                moveCell.center = point;
                break;
            }
        }
    }


}

-(void)moveCell:(MoveCell *)moveCell touchesEnd:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (!moveCell.moveCellIsMoving) {
        NSInteger section = moveCell.position.section;
        if (section ==0) {
            [self.moveCells_sectionTwo addObject:moveCell];
            [self.moveCells_sectionOne removeObject:moveCell];
        } else if (section ==1){
            [self.moveCells_sectionOne addObject:moveCell];
            [self.moveCells_sectionTwo removeObject:moveCell];
        }
        [self moveCellAnimationAction:moveCellAnimationTypeJumpToOtherSection];
        [self reSetDataSource];
    
    }
}

-(void)moveCell:(MoveCell *)moveCell touchesMove:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ///正在移动中
    moveCell.moveCellIsMoving = YES;
    
    CGPoint prePoint = [[touches anyObject] previousLocationInView:self];
    CGPoint currentPoint = [[touches anyObject] locationInView:self];
    CGPoint currentCenter = moveCell.center;
    CGFloat moveX =currentPoint.x - prePoint.x;
    CGFloat moveY = currentPoint.y-prePoint.y;
    currentCenter.x += moveX;
    currentCenter.y += moveY;
    
    for (int i =0 ; i <self.moveCells_sectionOne.count; i ++) {
        NSValue *pointValue = [self.points objectAtIndex:i];
        CGPoint point = [pointValue CGPointValue];
        CGRect rect =CGRectMake(point.x - self.moveCellWidth*0.5, point.y-self.moveCellheigth/2, self.moveCellWidth, self.moveCellheigth);
        if (CGRectContainsPoint(rect, currentCenter)) {
            if (moveCell.position.item ==i) {
                moveCell.destinationPositon = i;
            } else {
                moveCell.destinationPositon = -1;
            }
        }
    }
    if (moveCell.destinationPositon ==-1) {
        return;
    }
    
    ///更换数组
    NSMutableArray *replaceArr = [NSMutableArray new];
    ///处理数据
    [self.moveCells_sectionOne removeObject:moveCell];
    for (MoveCell *cell  in self.moveCells_sectionOne) {
        [replaceArr addObject:cell];
    }
    //插入移动的那个
    [replaceArr insertObject:moveCell atIndex:moveCell.destinationPositon];
    ///
    self.moveCells_sectionOne = replaceArr;
   ///从新设置第一个区cell的位置
    for (int i =0; i <self.moveCells_sectionOne.count; i++) {
        MoveCell *cell = [self.moveCells_sectionOne objectAtIndex:i];
        cell.position = [NSIndexPath indexPathForItem:i inSection:0];
    }
    
    
    [self moveCellAnimationAction:moveCellAnimationTypePanBetweenEachOther];
    [self reSetDataSource];

}


/// 动画操作
-(void)moveCellAnimationAction:(moveCellAnimationType)type{
    if (type == moveCellAnimationTypeJumpToOtherSection) {
        [self setSubViewsFrame];
        [UIView animateWithDuration:1 animations:^{
            for (int i = 0 ; i <self.moveCells_sectionOne.count; i ++) {
                MoveCell *cell = [self.moveCells_sectionOne objectAtIndex:i];
                cell.position = [NSIndexPath indexPathForItem:i inSection:0];
                NSValue *pointValue = [self.points objectAtIndex:i];
                CGPoint point = [pointValue CGPointValue];
                cell.center = point;
            }
            
            for (int i = 0 ; i <self.moveCells_sectionTwo.count; i ++) {
                MoveCell *cell = [self.moveCells_sectionTwo objectAtIndex:i];
                cell.position = [NSIndexPath indexPathForItem:i inSection:1];
                NSValue *pointValue = [self.points objectAtIndex:i+self.moveCells_sectionOne.count];
                CGPoint point = [pointValue CGPointValue];
                cell.center = point;
            }
            
        } completion:^(BOOL finished) {
           
        }];
    } else if (type == moveCellAnimationTypePanBetweenEachOther){
        [UIView animateWithDuration:1 animations:^{
            for (int i = 0 ; i <self.moveCells_sectionOne.count; i ++) {
                MoveCell *cell = [self.moveCells_sectionOne objectAtIndex:i];
                if (cell.destinationPositon !=-1) {
                    cell.destinationPositon  =-1;
                    continue;
                }
                
                NSValue *pointValue = [self.points objectAtIndex:i];
                CGPoint point = [pointValue CGPointValue];
                cell.center = point;
            }
        }];
        
    }
    
}

- (void)setSubViewsFrame {
    CGFloat moveCellH = [self getMoveCellWidth]/2;
    
    self.points = [self getCellCenter:self.moveCells_sectionOne.count section:0];
    //点击订阅更多频道
    NSValue *pointValue;
    if (self.points.count){
        pointValue = [self.points lastObject];
    }else{
       // pointValue = [NSValue valueWithCGPoint:_recommandLabel.center];
    }
    CGPoint point = [pointValue CGPointValue];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.moreLabel.frame = CGRectMake(0, point.y + moveCellH*0.5 +self.twoCellMargin, self.bounds.size.width, 40);
    }];
    
    [self.points addObjectsFromArray:[[self getCellCenter:self.moveCells_sectionTwo.count section:1] copy]];
}

/// 重新设置数据资源
- (void)reSetDataSource {
    NSMutableArray *currentChoiceArray = [@[] mutableCopy];
    NSMutableArray *otherChoiceArray = [@[] mutableCopy];
    for (MoveCell *cell in self.moveCells_sectionOne){
        NSString *content = cell.titleLabel.text;
        [currentChoiceArray addObject:content];
    }
    
    for (MoveCell *cell in self.moveCells_sectionTwo){
        NSString *content = cell.titleLabel.text;
        [otherChoiceArray addObject:content];
    }
    
    self.currentChoiceChannels = [currentChoiceArray mutableCopy];
    self.otherChnnels = [otherChoiceArray mutableCopy];
}


@end
