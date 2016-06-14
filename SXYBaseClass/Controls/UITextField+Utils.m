//
//  UITextField+Utils.m
//  MIGUOA
//
//  Created by zhongyang on 15/12/7.
//
//

#import "UITextField+Utils.h"

@implementation UITextField (Utils)

- (void)limitTextFieldLength:(int)maxLen {
    NSString *toBeString = __trim_space(self.text);
    NSArray * currentar = [UITextInputMode activeInputModes];
    UITextInputMode * current = [currentar firstObject];

    UITextRange *selectedRange = [self markedTextRange];
    NSString *newText = [self textInRange:selectedRange];

    if ([current.primaryLanguage isEqualToString:@"zh-Hans"]) {
        UITextRange *selectedRange = [self markedTextRange];
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        if (!position) {
            if (toBeString.length > (maxLen + newText.length)) {
                self.text = [toBeString substringWithRange:NSMakeRange(0, maxLen + newText.length)];
            }
        }
        else{

        }
    }
    else{
        if (toBeString.length > (maxLen + newText.length)) {
            self.text = [toBeString substringWithRange:NSMakeRange(0, maxLen + newText.length)];
        }
    }
}

@end
