//
//  UIBarButtonItem+Extension.m
//  iOSFramework
//
//  Created by apple on 16/5/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
+ (instancetype)setNavigationBarBackGroundImgName:(NSString*)imageName target : (UIViewController *)target selector: (SEL)selector
{
    UIButton * rightButton= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    rightButton.size = rightButton.imageView.image.size;
    [rightButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    return rightBarBtnItem;
}
@end
