//
//  SXYBtn.h
//  MIGUOA
//
//  Created by zhongyang on 15/12/1.
//
//

#import <UIKit/UIKit.h>

#define FORMAT_TEXT(button, title) \
    [button setTitle:title forState:UIControlStateSelected];\
    [button setTitle:title forState:UIControlStateNormal];\
    [button setTitle:title forState:UIControlStateHighlighted];\
    [button setTitle:title forState:UIControlStateDisabled];

#define FORMAT_ATTRIBUTE_TEXT(button, title) \
    [button setAttributedTitle:title forState:UIControlStateSelected];\
    [button setAttributedTitle:title forState:UIControlStateNormal];\
    [button setAttributedTitle:title forState:UIControlStateHighlighted];\
    [button setAttributedTitle:title forState:UIControlStateDisabled];

#define FORMAT_TEXT_COLOR(button, textColor) \
    [button setTitleColor:textColor forState:UIControlStateNormal]; \
    [button setTitleColor:textColor forState:UIControlStateHighlighted]; \
    [button setTitleColor:textColor forState:UIControlStateDisabled]; \
    [button setTitleColor:textColor forState:UIControlStateSelected];

#define FORMAT_IMAGE(button, img) \
    [button setImage:img forState:UIControlStateNormal]; \
    [button setImage:img forState:UIControlStateHighlighted]; \
    [button setImage:img forState:UIControlStateDisabled]; \
    [button setImage:img forState:UIControlStateSelected];

#define FORMAT_BG_IMAGE(button, img) \
    [button setBackgroundImage:img forState:UIControlStateNormal]; \
    [button setBackgroundImage:img forState:UIControlStateHighlighted]; \
    [button setBackgroundImage:img forState:UIControlStateDisabled]; \
    [button setBackgroundImage:img forState:UIControlStateSelected];

@interface SXYBtn : UIButton {

}

@property(nonatomic, strong)UIColor *normalBorderColor;
@property(nonatomic, strong)UIColor *highlightBorderColor;
@property(nonatomic, strong)UIColor *disableBorderColor;

@property(nonatomic, assign)CGFloat imageWidth;
@property(nonatomic, assign)CGFloat imageHeight;
@property(nonatomic, assign)CGFloat imageLeftInst;

@property(nonatomic, assign)CGFloat vTopDistance;
@property(nonatomic, assign)CGFloat vMiddleDistance;
@property(nonatomic, assign)CGFloat vBottomDistance;

- (void)setUniqueText:(NSString *)text;
- (void)setUniqueAttributeText:(NSAttributedString *)text;
- (void)setUniqueTextColor:(UIColor *)color;
- (void)setUniqueImage:(UIImage *)image;
- (void)setUniqueBGImage:(UIImage *)image;


- (void)setLeftImageRightText;
- (void)setLeftTextRightImage;
- (void)setTopImageBottomText;

- (void)setVDistance:(CGFloat)vDistance;

- (void)clearTargetActions;

@end
