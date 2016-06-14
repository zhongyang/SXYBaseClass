//
//  SXYViewController+Progress.h
//  MIGUOA
//
//  Created by zhongyang on 15/12/17.
//
//

#import "SXYViewController.h"

@interface SXYViewController (Progress) {

}

- (void)hideWaittingView;
- (void)showWaittingView;
- (void)showWaittingViewToView:(UIView *)view;

- (void)showWaittingViewWithTitle:(NSString *)title;
- (void)showWaittingViewWithOutAutoDismiss;

- (void)showGlobalWaittingView;
- (void)hideGlobalWaittingView;

@end
