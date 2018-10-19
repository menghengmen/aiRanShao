//
//  MainTabBarController.m
//  Yueshijia
//
//  Created by CosyVan on 2016/11/20.
//  Copyright © 2016年 Jeffery. All rights reserved.
//

#import "MainTabBarController.h"
#import "MyTabBar.h"
#import "NavigationViewController.h"
#import "HomeViewController.h"
#import "HouseDetailViewController.h"
#import "AbroadViewController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    homeVC.title = @"推荐";
    [self addChildVC:homeVC imageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon"];

    HouseDetailViewController *houseVC = [[HouseDetailViewController alloc] init];
    houseVC.title = @"房源";
    [self addChildVC:houseVC imageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon"];
    
    AbroadViewController *abroadVC = [[AbroadViewController alloc] init];
    abroadVC.title = @"海外住宅";
    [self addChildVC:abroadVC imageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon"];

    
    MyTabBar *myTabBar = [[MyTabBar alloc] init];
    [self setValue:myTabBar forKey:@"tabBar"];
}

- (void)addChildVC:(UIViewController *)childVc imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    
    // 设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    
    //设置文字样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = RGB(168, 168, 168);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置tabBarItem的选中文字颜色
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = RGB(211,192,162);
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 添加为tabbar控制器的子控制器
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
}



@end
