//
//  HouseDetailViewController.m
//  高仿马蹄运动
//
//  Created by 哈哈 on 2018/10/18.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "HouseDetailViewController.h"
#import "XYFlatBrawerHeader.h"
#import "XYImageModel.h"
#import "XYBrawerHeaderImageView.h"

@interface HouseDetailViewController ()<FlatDrawerDelegate>
@property (nonatomic,strong) XYFlatBrawerHeader *header;
@property (nonatomic,strong) NSMutableArray *imagesData;

@end

@implementation HouseDetailViewController

-(XYFlatBrawerHeader*)header{
    if (!_header) {
        _header = [[XYFlatBrawerHeader alloc] initWithFrame:CGRectMake(0, 64, SCREENWIDTH, 230)];
        _header.delegate = self;
    }
    return _header;
    
}

-(NSMutableArray *)imagesData{
    if (!_imagesData) {
        
    _imagesData = [NSMutableArray array];
    }
    return _imagesData;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    NSString *str = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSArray *arr  = [NSArray arrayWithContentsOfFile:str];
    NSMutableArray *sectionArr = [NSMutableArray new];
    NSMutableArray *sectionArr1 = [NSMutableArray new];
    NSMutableArray *sectionArr2 = [NSMutableArray new];
    NSMutableArray *sectionArr3 = [NSMutableArray new];

    for (int i =0 ; i <arr.count; i++) {
        XYImageModel *model = [XYImageModel mj_objectWithKeyValues:(NSDictionary*)arr[i]];
        if ([model.des isEqualToString:@"楼体外观"]) {
            [sectionArr addObject:model];
        } else if ([model.des isEqualToString:@"栋座分布图"]){
            [sectionArr1 addObject:model];

        } else if ([model.des isEqualToString:@"鸟瞰图"]){
            [sectionArr2 addObject:model];

        } else{
            [sectionArr3 addObject:model];


        }
            
    }
    
    [self.imagesData addObject:sectionArr];

    [self.imagesData addObject:sectionArr1];
    [self.imagesData addObject:sectionArr2];
    [self.imagesData addObject:sectionArr3];

    [self.view addSubview:self.header];
    [self.header reloadData];
}
#pragma mark FlatDrawerDelegate
////标题
-(NSArray*)titlesOfFlatBrawer:(XYFlatBrawerHeader *)flatBrawerHeader{
    NSMutableArray *arr = [NSMutableArray array];
    for (NSArray *arr1 in self.imagesData) {
        XYImageModel *model = arr1[0];
        if (model.des.length >0) {
            [arr addObject:model.des];
        }
    }
        return arr;
}
////组数
-(NSInteger)numOfSectionsInDrawer:(XYFlatBrawerHeader *)flatBrawerHeader{
    return self.imagesData.count;
}
//每组个数
-(NSInteger)flatBrawerHeader:(XYFlatBrawerHeader *)flatBrawerHeader numOfIntemsInSection:(NSInteger)sectionIndex{
    NSArray *arr = self.imagesData[sectionIndex];
    return arr.count;
}
-(UIImageView *)flatBrawerHeader:(XYFlatBrawerHeader *)flatBrawerHeader itemForHeaderAtIndex:(NSInteger)index{
    //初始化
    XYBrawerHeaderImageView *image = [[XYBrawerHeaderImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 230)];

   //赋值相关
    NSMutableArray *arr = [NSMutableArray array];
    for (NSArray *arr1 in self.imagesData) {
        for (XYImageModel *image in arr1) {
            [arr addObject:image];
        }
    }
    XYImageModel *model = arr[index];
    image.model= model;
    image.index = index;
    if (model.isVideo == XYPhonesTypeFullVideos || model.isVideo == XYPhonesTypeFullImage) {
        //image.url = self.model.title_image;
        image.url = @"";
    }
   return image;
}

@end
