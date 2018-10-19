//
//  AbroadViewController.m
//  高仿马蹄运动
//
//  Created by 哈哈 on 2018/10/19.
//  Copyright © 2018年 哈哈. All rights reserved.
//

#import "AbroadViewController.h"
#import "XYCollectionBrawer.h"
@interface AbroadViewController ()
@property (nonatomic,strong) XYCollectionBrawer *header;
@property (nonatomic,strong) NSMutableArray *imagesData;

@end

@implementation AbroadViewController

-(XYCollectionBrawer *)header{
    if (!_header) {
        _header = [[XYCollectionBrawer alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, 230)];
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
    NSString *str = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSArray *arr  = [NSArray arrayWithContentsOfFile:str];
    NSMutableArray *sectionArr = [NSMutableArray new];
    NSMutableArray *sectionArr1 = [NSMutableArray new];
    NSMutableArray *sectionArr2 = [NSMutableArray new];
    NSMutableArray *sectionArr3 = [NSMutableArray new];
    NSMutableArray *sectionArr4 = [NSMutableArray new];
    NSMutableArray *sectionArr5 = [NSMutableArray new];
    
    for (int i =0 ; i <arr.count; i++) {
        XYImageModel *model = [XYImageModel mj_objectWithKeyValues:(NSDictionary*)arr[i]];
        if ([model.des isEqualToString:@"楼体外观"]) {
            [sectionArr addObject:model];
        } else if ([model.des isEqualToString:@"栋座分布图"]){
            [sectionArr1 addObject:model];
            
        } else if ([model.des isEqualToString:@"鸟瞰图"]){
            [sectionArr2 addObject:model];
            
        } else if ([model.des isEqualToString:@"客房"]){
            [sectionArr4 addObject:model];
            
        }else if ([model.des isEqualToString:@"卫浴"]){
            [sectionArr5 addObject:model];
            
        }else{
            [sectionArr3 addObject:model];
            
            
        }
        
    }
    
    [self.imagesData addObject:sectionArr];
    
    [self.imagesData addObject:sectionArr1];
    [self.imagesData addObject:sectionArr2];
    [self.imagesData addObject:sectionArr3];
    [self.imagesData addObject:sectionArr4];
    [self.imagesData addObject:sectionArr5];
    [self.view addSubview:self.header];
    self.header.imagesArray = self.imagesData;
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
