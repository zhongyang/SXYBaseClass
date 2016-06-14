//
//  SXYBtn.m
//  MIGUOA
//
//  Created by zhongyang on 15/12/1.
//
//

#import "SXYBtn.h"

@interface SXYBtn () {
    BOOL _bLeftImageRightText;
    BOOL _bTopImageBottomText;
    BOOL _bLeftTextRightImage;
}

@end

@implementation SXYBtn

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setExclusiveTouch:YES];
        [self setBackgroundColor:[UIColor clearColor]];

        _vTopDistance = 5.0f;
        _vMiddleDistance = 5.0f;
        _vBottomDistance = 5.0f;
    }
    return self;
}

- (void)setVDistance:(CGFloat)vDistance {
    _vTopDistance = vDistance;
    _vMiddleDistance = vDistance;
    _vBottomDistance = vDistance;
}

- (void)setLeftImageRightText {
    _bLeftImageRightText = YES;
    [self layoutSubviews];
}

- (void)setLeftTextRightImage {
    _bLeftTextRightImage = YES;
    [self layoutSubviews];
}

- (void)setTopImageBottomText {
    _bTopImageBottomText = YES;
    [self layoutSubviews];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    if (_bLeftImageRightText) {
        if (_imageWidth == 0) {
            _imageWidth = self.height;
        }

        if (_imageHeight == 0) {
            _imageHeight = self.height;
        }

        [self.imageView setFrame:CGRectMake(_imageLeftInst, (self.height-_imageHeight)/2, _imageWidth, _imageHeight)];
        [self.titleLabel setFrame:CGRectMake(_imageLeftInst+_imageWidth, 0, self.width - self.height, self.height)];
        [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
    }

    if (_bLeftTextRightImage) {
        if (_imageWidth == 0) {
            _imageWidth = self.height;
        }

        if (_imageHeight == 0) {
            _imageHeight = self.height;
        }

        [self.imageView setFrame:CGRectMake(self.width-_imageWidth, (self.height-_imageHeight)/2, _imageWidth, _imageHeight)];
        [self.titleLabel setFrame:CGRectMake(0, 0, self.width - self.imageView.width, self.height)];
        [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
    }

    if (_bTopImageBottomText) {
        CGSize textSize = [self.titleLabel.text computeTextSizeWithFont:self.titleLabel.font
                                                   maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        CGFloat lableWidth = self.width;
        CGFloat lableHeight= textSize.height;

        CGFloat imageHeight= self.height - _vTopDistance - _vMiddleDistance - _vBottomDistance - lableHeight;
        if (self.titleLabel.text.length == 0) {
            imageHeight= self.height - _vTopDistance - _vBottomDistance;
        }
        CGFloat imageWidth = imageHeight;

        [self.titleLabel setFrame:CGRectMake(0, self.height-lableHeight-_vBottomDistance, lableWidth, lableHeight)];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.imageView setFrame:CGRectMake((self.width-imageWidth)/2, _vTopDistance, imageWidth, imageHeight)];
    }
}


- (void)setUniqueText:(NSString *)text {
    FORMAT_TEXT(self, text)
}

- (void)setUniqueAttributeText:(NSAttributedString *)text {
    FORMAT_ATTRIBUTE_TEXT(self, text)
}

- (void)setUniqueTextColor:(UIColor *)color {
    FORMAT_TEXT_COLOR(self, color)
}

- (void)setUniqueImage:(UIImage *)image {
    FORMAT_IMAGE(self, image)
}

- (void)setUniqueBGImage:(UIImage *)image {
    FORMAT_BG_IMAGE(self, image);
}

- (void)clearTargetActions {
    for (id target in self.allTargets) {
        NSArray *actions = [self actionsForTarget:target forControlEvent:UIControlEventTouchUpInside];
        for (NSString *action in actions) {
            [self removeTarget:target action:NSSelectorFromString(action) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

@end
