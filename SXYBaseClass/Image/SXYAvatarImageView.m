//
//  SXYAvatarImageView.m
//  MIGUOA
//
//  Created by zhongyang on 15/12/21.
//
//

#import "SXYAvatarImageView.h"
#import "UIImageView+WebCache.h"

@implementation SXYAvatarImageView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)setImage:(NSString *)url placeHolder:(UIImage *)image {
    [self modifyToAvatarEffect];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:image];
}

@end
