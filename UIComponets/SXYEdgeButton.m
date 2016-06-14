//
//  SXYEdgeButton.m
//  MIGUMOA
//
//  Created by wuhaizeng on 16/3/10.
//
//

#import "SXYEdgeButton.h"

@implementation SXYEdgeButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect imageFrame = self.imageView.frame;
    imageFrame.origin.y = self.edge.top;
    imageFrame.origin.x = self.edge.left;
    self.imageView.frame = imageFrame;

    CGRect titleLabelFrame = self.titleLabel.frame;
    CGSize labelSize = [self.titleLabel.text computeTextSizeWithFont:self.titleLabel.font maxSize:self.frame.size];
    titleLabelFrame.size.width = labelSize.width;
    titleLabelFrame.size.height = labelSize.height;
    titleLabelFrame.origin.x = (self.frame.size.width / 2)+self.edge.left/2;
    self.titleLabel.frame = titleLabelFrame;
}

@end
