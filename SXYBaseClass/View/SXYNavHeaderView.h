//
//  SXYNavHeaderView.h
//  MIGUOA
//
//  Created by zhongyang on 15/12/1.
//
//

#import "SXYView.h"

@interface SXYNavHeaderView : SXYView


+ (SXYNavHeaderView *)createNavHeaderViewIn:(UIView *)view;

- (SXYBtn *)getLeftBtn;
- (SXYBtn *)getRightBtn;
- (SXYLabel *)getTitleLabel;

@end
