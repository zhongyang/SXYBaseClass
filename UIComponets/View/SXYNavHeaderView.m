//
//  SXYNavHeaderView.m
//  MIGUOA
//
//  Created by zhongyang on 15/12/1.
//
//

#import "SXYNavHeaderView.h"

@interface SXYNavHeaderView () {
    SXYView *_navHeaderView;
    SXYLabel *_navTitleLabel;
    SXYBtn *_navLeftButton;
    SXYBtn *_navRightButton;
}

@end

@implementation SXYNavHeaderView


+ (SXYNavHeaderView *)createNavHeaderViewIn:(UIView *)view {
    SXYNavHeaderView *navHeaderView = [[SXYNavHeaderView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, SXY_NAV_HEADER_HEIGHT)];
    [navHeaderView setupSXYDefaultStyle];
    [view addSubview:navHeaderView];
    return navHeaderView;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    CGFloat btnWidth = 60.0f;
    CGFloat btnHeight= self.height - SXY_STATUS_BAR_HEIGHT;

    CGFloat titleWidth = self.width - 2*btnWidth;
    CGFloat titleHeight= self.height - SXY_STATUS_BAR_HEIGHT;

    _navTitleLabel = [[SXYLabel alloc] initWithFrame:CGRectMake(btnWidth, SXY_STATUS_BAR_HEIGHT, titleWidth, titleHeight)];
    [self addSubview:_navTitleLabel];
    [_navTitleLabel setTextAlignment:NSTextAlignmentCenter];
    [_navTitleLabel setBackgroundColor:[UIColor clearColor]];

    _navLeftButton = [[SXYBtn alloc] initWithFrame:CGRectMake(0, SXY_STATUS_BAR_HEIGHT, btnWidth, btnHeight)];
    [self addSubview:_navLeftButton];

    _navRightButton= [[SXYBtn alloc] initWithFrame:CGRectMake(self.width-btnWidth, SXY_STATUS_BAR_HEIGHT, btnWidth, btnHeight)];
    [self addSubview:_navRightButton];
}

- (void)setupSXYDefaultStyle {
    self.backgroundColor = _theme_color;

    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0,3);
    self.layer.shadowOpacity = 0.3;
    self.layer.shadowRadius = 2;

    _navTitleLabel.font = [UIFont systemFontOfSize:SXY_NAV_TITLE_FONT_SIZE];
    _navTitleLabel.textColor = [UIColor whiteColor];

    [_navLeftButton.titleLabel setFont:[UIFont systemFontOfSize:SXY_NAV_BTN_FONT_SIZE]];
    [_navRightButton.titleLabel setFont:[UIFont systemFontOfSize:SXY_NAV_BTN_FONT_SIZE]];

    [_navLeftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_navLeftButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];

    [_navRightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_navRightButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
}

- (SXYBtn *)getLeftBtn {
    return _navLeftButton;
}

- (SXYBtn *)getRightBtn {
    return _navRightButton;
}

- (SXYLabel *)getTitleLabel {
    return _navTitleLabel;
}

@end
