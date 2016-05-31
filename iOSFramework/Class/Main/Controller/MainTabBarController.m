//
//  MainTabBarController.m
//  iOSFramework
//
//  Created by apple on 16/5/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIViewController *homeController = [[UIViewController alloc] init];
    [self addChildController:homeController title:@"首页" iconNormal:@"tabBar_essence_icon" iconSelected:@"tabBar_essence_click_icon"];
    
    UIViewController *circleVc = [[UIViewController alloc] init];
    [self addChildController:circleVc title:@"圈子" iconNormal:@"tabBar_friendTrends_icon" iconSelected:@"tabBar_friendTrends_click_icon"];
    
    UIViewController *nearbyVc = [[UIViewController alloc] init];
    [self addChildController:nearbyVc title:@"附近" iconNormal:@"tabBar_new_icon" iconSelected:@"tabBar_new_click_icon"];
    
    UIViewController *mineVc = [[UIViewController alloc] init];
    [self addChildController:mineVc title:@"我的" iconNormal:@"tabBar_me_icon" iconSelected:@"tabBar_me_click_icon"];
}
- (void) addChildController : (UIViewController *) viewController title : (NSString *) title iconNormal : (NSString *) iconNormal iconSelected : (NSString *) iconSelected
{
    viewController.view.backgroundColor = HBRandomColor; //添加背景色（随机色）
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:iconNormal];
    UIImage *selectedImage = [UIImage imageNamed:iconSelected];
    // 声明：这张图片按照原始的样子显示出来，不要渲染成其他的颜色（比如说默认的蓝色）
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = selectedImage;
    [self addChildViewController:[[MainNavigationController alloc] initWithRootViewController:viewController]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
