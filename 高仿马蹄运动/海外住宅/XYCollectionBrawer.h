//
//  XYCollectionBrawer.h
//  testDemo
//
//  Created by 哈哈 on 2018/10/19.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XYImageModel.h"
@interface XYCollectionBrawer : UIView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *imageViewCollection;

@property (nonatomic,strong) UIScrollView *titlesScrollView;
@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong)NSArray *imagesArray;
@property (nonatomic,strong) NSString *title_imageUrl;

@property (nonatomic,copy) void(^imageClickBlock)(XYImageModel *model,NSInteger index);

@end
