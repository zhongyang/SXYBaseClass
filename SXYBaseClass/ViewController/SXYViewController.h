//
//  SXYViewController.h
//  MigrateIM
//
//  Created by zhongyang on 15/11/30.
//  Copyright © 2015年 zhongyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface SXYViewController : UIViewController {
    MBProgressHUD *_progressView;
    NSTimer *_progressTimer;

    UIWindow *_hudWindow;
}

@property(nonatomic, strong) NSObject *objectParams;

- (BOOL)isRootViewController;

@end
