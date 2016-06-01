//
//  LGJProductsViewController.h
//  iOSFramework
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ProductsDelegate <NSObject>
- (void)willDisplayHeaderView:(NSInteger)section;
- (void)didEndDisplayingHeaderView:(NSInteger)section;
@end

@interface LGJProductsViewController : UIViewController
@property (nonatomic,weak) __weak id <ProductsDelegate> delegate;
/**
 *  当CategoryTableView滚动时,ProductsTableView跟随滚动至指定section
 */
- (void)scrollToSelectedIndexPath:(NSIndexPath *)indexPath;
@end
