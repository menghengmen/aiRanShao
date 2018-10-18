//
//  XYBrawerHeaderImageView.h
//  XiongDaJinFu
//
//  Created by 哈哈 on 2018/10/18.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYImageModel.h"
@interface XYBrawerHeaderImageView : UIImageView
@property (nonatomic,assign) XYPhonesType isPlayer;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,strong) NSString *url;

@property (nonatomic,strong) XYImageModel *model;

@property (nonatomic,copy) void(^imageClickBlock)();
@end
