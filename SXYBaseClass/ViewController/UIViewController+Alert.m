//
//  SXYViewController+Alert.m
//  MIGUOA
//
//  Created by zhongyang on 15/12/4.
//
//

#import "UIViewController+Alert.h"
#import "OLGhostAlertView.h"

@implementation UIViewController (Alert)

- (void)showToast:(NSString *)alert {
    OLGhostAlertView *alertView = [[OLGhostAlertView alloc] initWithTitle:alert message:nil];
    alertView.style = OLGhostAlertViewStyleDark;
    alertView.timeout = 2.0f;
    [alertView show];
}

@end
