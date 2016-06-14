//
//  SXYViewController+Progress.m
//  MIGUOA
//
//  Created by zhongyang on 15/12/17.
//
//

#import "SXYViewController+Progress.h"
#import "HWWeakTimer.h"

@implementation SXYViewController (Progress)

- (void)hideWaittingView {
    if (_progressView) {
        [_progressView removeFromSuperview];
        _progressView = nil;
    }

    if (_progressTimer && [_progressTimer isValid]) {
        [_progressTimer invalidate];
        _progressTimer = nil;
    }
}

- (void)showWaittingViewWithOutAutoDismiss {
    [self hideWaittingView];
    _progressView = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (void)showWaittingViewWithTitle:(NSString *)title {
    [self showWaittingView];
    _progressView.labelText = title;
}

- (void)showWaittingView {
    [self showWaittingViewToView:self.view];
    __weak_self;
    _progressTimer = [HWWeakTimer scheduledTimerWithTimeInterval:20 block:^(id userInfo) {
        [weakself hideWaittingView];
    } userInfo:@"Fire" repeats:YES];
}

- (void)showWaittingViewToView:(UIView *)view {
    [self hideWaittingView];
    _progressView = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    __weak_self;
    _progressTimer = [HWWeakTimer scheduledTimerWithTimeInterval:20 block:^(id userInfo) {
        [weakself hideWaittingView];
    } userInfo:@"Fire" repeats:YES];
}

- (void)showGlobalWaittingView {
    _hudWindow = [[[UIApplication sharedApplication] windows] lastObject];
    _progressView = [MBProgressHUD showHUDAddedTo:_hudWindow animated:YES];
    __weak_self;
    _progressTimer = [HWWeakTimer scheduledTimerWithTimeInterval:20 block:^(id userInfo) {
        [weakself hideWaittingView];
    } userInfo:@"Fire" repeats:YES];
}

- (void)hideGlobalWaittingView {
    [MBProgressHUD hideHUDForView:_hudWindow animated:YES];
    _hudWindow = nil;
}

@end
