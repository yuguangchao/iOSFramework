//
//  MeViewController.m
//  iOSFramework
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /**
     *  长按图片保存实现方法
     *
     *  @return <#return value description#>
     */
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 200, 200)];
    imageView.image = [UIImage imageNamed:@"login_register_background"];
    
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [imageView addGestureRecognizer:longPress];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
}
-(void)longPress:(UILongPressGestureRecognizer*)gesture{
    if(gesture.state==UIGestureRecognizerStateBegan)
    {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"保存图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
           
            
        }]];
        
        [alertVC addAction:[UIAlertAction actionWithTitle:@"保存图片到手机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIImageView* imageviews = (UIImageView*) gesture.view;
            UIImageWriteToSavedPhotosAlbum(imageviews.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
            
        }]];
        
        [self presentViewController:alertVC animated:YES completion:nil];
        
    }
}
// 回调方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    // 没有错误
    if (error == nil) {
        // 弹框
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"保存成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertVC addAction:[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            
            
        }]];
        // 将其显示到界面上
        [self presentViewController:alertVC animated:YES completion:nil];
    }
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
