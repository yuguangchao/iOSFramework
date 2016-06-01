//
//  HomeViewController.m
//  iOSFramework
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "HBTextViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"跳转" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    
    }
- (void)push
{
    self.hidesBottomBarWhenPushed = YES;//跳转前隐藏tabbar
    HBTextViewController *text1Vc = [[HBTextViewController alloc] init];
    text1Vc.title = @"标题";
        [self.navigationController pushViewController:text1Vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;//push后设置显示
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
