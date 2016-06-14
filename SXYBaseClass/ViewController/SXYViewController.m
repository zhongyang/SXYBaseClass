//
//  SXYViewController.m
//  MigrateIM
//
//  Created by zhongyang on 15/11/30.
//  Copyright © 2015年 zhongyang. All rights reserved.
//

#import "SXYViewController.h"

@interface SXYViewController () {

}

@end

@implementation SXYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isRootViewController {
    UIViewController *rootViewController = [self.navigationController.viewControllers firstObject];
    return rootViewController == self;
}

@end
