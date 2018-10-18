//
//  XYFlatBrawerHeaderBtn.m
//  testDemo
//
//  Created by 哈哈 on 2018/10/18.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "XYFlatBrawerHeaderBtn.h"

@implementation XYFlatBrawerHeaderBtn

-(void)setIsSection:(BOOL)isSection{
    _isSection = isSection;
    if (_isSection) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }else{
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
}

@end
