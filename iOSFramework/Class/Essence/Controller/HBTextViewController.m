//
//  HBTextViewController.m
//  iOSFramework
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HBTextViewController.h"
#import "LGJProductsViewController.h"
@interface HBTextViewController ()<UITableViewDelegate,UITableViewDataSource,ProductsDelegate>
@property (nonatomic, strong) UITableView *categoryTableView;
@property (nonatomic, strong) NSArray *categoryArr;
@property (nonatomic, strong)  LGJProductsViewController *productsVC;
@end

@implementation HBTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configData];
    [self createTableView];
    [self createProductsVC];
}
- (void)configData {
    
    if (!_categoryArr) {
        
        NSArray *numArr = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"十",@"十一",@"十二",@"十三",@"十四",@"十五",@"十六",@"十七",@"十八",@"十九",@"二十"];
        NSMutableArray *tmpArr = [NSMutableArray array];
        for (int i = 0; i < 20; i++) {
            NSString *tmpStr = [NSString stringWithFormat:@"第%@类", numArr[i]];
            [tmpArr addObject:tmpStr];
        }
        _categoryArr = tmpArr;
    }
}

- (void)createTableView {
    
    self.categoryTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.25, self.view.frame.size.height) style:UITableViewStylePlain];
    self.categoryTableView.delegate = self;
    self.categoryTableView.dataSource = self;
    self.categoryTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.categoryTableView];
}

- (void)createProductsVC {
    
    _productsVC = [[LGJProductsViewController alloc] init];
    _productsVC.delegate = self;
    [self addChildViewController:_productsVC];
    [self.view addSubview:_productsVC.view];
}

//MARK:-tableView的代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _categoryArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *ident = @"ident";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    
    cell.textLabel.text = [_categoryArr objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击左边tableview
    if (_productsVC) {
        [_productsVC scrollToSelectedIndexPath:indexPath];
    }
}

#pragma mark - ProductsDelegate
- (void)willDisplayHeaderView:(NSInteger)section {
    //右边向下滑
    [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

- (void)didEndDisplayingHeaderView:(NSInteger)section {
    //左边向上滑
    NSLog(@"😭😭%ld",section);

    [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:section + 1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
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
