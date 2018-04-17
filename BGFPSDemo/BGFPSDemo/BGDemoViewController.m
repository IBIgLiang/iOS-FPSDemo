//
//  BGDemoViewController.m
//  BGFPSDemo
//
//  Created by zhangzhiliang on 2018/4/16.
//  Copyright © 2018年 zhangzhiliang. All rights reserved.
//

#import "BGDemoViewController.h"
#import "BGFPSLabel.h"
#import "BGDemoViewController.h"
@interface BGDemoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) BGFPSLabel * FPSLabel;

@end

@implementation BGDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试";
    self.view.backgroundColor = [UIColor yellowColor];
    
//    [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"yes");
//    }];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.FPSLabel];
    self.FPSLabel.frame = CGRectMake(200, 200, 50, 30);
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];

}

#pragma mark privateMethods
-(void)NavigationBarClear:(UINavigationBar *)navigationBar hidden:(BOOL) hidden
{
    if ([navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]){
        NSArray *list = navigationBar.subviews;
        for (id obj in list) {
            if ([obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView = (UIImageView *)obj;
                imageView.hidden = hidden;
            }
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"显示效果所用%tu",indexPath.row];
    [cell.imageView setImage:indexPath.row%2==0?[UIImage imageNamed:@"timg"]:[UIImage imageNamed:@"beijing"]];
    if (cell) {
        return cell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BGDemoViewController *vc = [[BGDemoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (UITableView *)tableView {
    
    if (_tableView == nil) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-44)];
        _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    
    return _tableView;
}

- (BGFPSLabel *)FPSLabel {
    
    if (_FPSLabel == nil) {
        _FPSLabel = [BGFPSLabel new];
    }
    
    return _FPSLabel;
}

@end
