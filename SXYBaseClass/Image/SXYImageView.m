//
//  SXYImageView.m
//  MIGUOA
//
//  Created by zhongyang on 15/12/1.
//
//

#import "SXYImageView.h"

@implementation SXYImageView


- (void)modifyToAvatarEffect {
    self.layer.cornerRadius= self.frame.size.width/2;
    self.layer.masksToBounds= YES;
}

- (void)modifyToRedPointEffect {
    UIImage *image = [UIImage createImageFromColor:[UIColor redColor]];
    image = [UIImage roundedRectImageFromImage:image size:CGSizeMake(10.0f, 10.0f) withCornerRadius:5.0f];

    self.image = image;
    self.highlightedImage = image;
}

@end
