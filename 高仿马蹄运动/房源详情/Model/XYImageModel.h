//
//  XYImageModel.h
//  XiongDaJinFu
//
//  Created by 哈哈 on 2018/10/18.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYImageModel : NSObject
@property (nonatomic,strong) NSString *picId;
@property (nonatomic,strong) NSString *url;
@property (nonatomic,strong) NSString *des;
@property (nonatomic,assign) XYPhonesType isVideo;
@end
