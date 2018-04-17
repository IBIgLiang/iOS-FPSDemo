//
//  ViewController.m
//  BGFPSDemo
//
//  Created by zhangzhiliang on 2018/4/16.
//  Copyright © 2018年 zhangzhiliang. All rights reserved.
//

#import "ViewController.h"
#import "BGDemoViewController.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.navigationItem.title = @"FPSDemo";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Demo" style:UIBarButtonItemStylePlain target:self action:@selector(touchRightNavButton)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchRightNavButton {
    
    BGDemoViewController *vc = [[BGDemoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
