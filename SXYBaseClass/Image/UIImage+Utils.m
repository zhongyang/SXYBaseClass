//
//  UIImage+Utils.m
//  MIGUOA
//
//  Created by zhongyang on 15/12/1.
//
//

#import "UIImage+Utils.h"

@implementation UIImage (Utils)

+ (UIImage *)createImageFromColor:(UIColor *)color {
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);

    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)resizeImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)CropSqureImage:(UIImage *)image {
    double refWidth = CGImageGetWidth(image.CGImage) - 2.0f;
    double refHeight = CGImageGetHeight(image.CGImage)- 2.0f;

    CGSize size = CGSizeZero;
    if (refWidth > refHeight) {
        size = CGSizeMake(refHeight, refHeight);
    } else {
        size = CGSizeMake(refWidth, refWidth);
    }

    double x = (refWidth - size.width) / 2.0;
    double y = (refHeight - size.height) / 2.0;

    CGRect cropRect = CGRectMake(x, y, size.height, size.width);
    CGImageRef imageRef = CGImageCreateWithImageInRect([image CGImage], cropRect);
    UIImage * cropped = [UIImage imageWithCGImage:imageRef scale:1.0 orientation:image.imageOrientation];
    CGImageRelease(imageRef);

    return cropped;
}

+ (UIImage *)roundedRectImageFromImage:(UIImage *)image size:(CGSize)imageSize withCornerRadius:(float)cornerRadius {
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    CGRect bounds=(CGRect){CGPointZero,imageSize};
    [[UIBezierPath bezierPathWithRoundedRect:bounds cornerRadius:cornerRadius] addClip];
    [image drawInRect:bounds];
    UIImage *finalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return finalImage;
}

+ (UIImage *)loadImage:(NSString *)name ext:(NSString *)ext {
    return [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@.%@", [[NSBundle mainBundle] resourcePath], name, ext]];
}

+ (UIImage *)pngImage:(NSString *)imageName {
    return [UIImage loadImage:imageName ext:@"png"];
}

+ (UIImage *)jpgImage:(NSString *)imageName {
    return [UIImage loadImage:imageName ext:@"jpg"];
}

+ (UIImage *)generateDefalutImage:(UIColor *)backgroundColor
                   backgroundSize:(CGSize)backgroundSize
                     defaultImage:(UIImage *)defaultImage
                 defaultImageSize:(CGSize)defaultImageSize {
    CGFloat viewWdith = backgroundSize.width;
    CGFloat viewHeight= backgroundSize.height;

    CGFloat imageWidth = defaultImageSize.width;
    CGFloat imageHeight= defaultImageSize.height;

    if (viewWdith < imageWidth || viewHeight < imageHeight) {
        if (viewWdith > viewHeight) {
            imageHeight = viewHeight/2;
            imageWidth = imageHeight;
        } else {
            imageHeight = viewWdith/2;
            imageWidth = imageHeight;
        }
    }

    CGRect rect=CGRectMake(0.0f, 0.0f, viewWdith, viewHeight);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
    CGContextFillRect(context, rect);

    UIImage *loadImage = defaultImage;
    [loadImage drawInRect:CGRectMake((viewWdith-imageWidth)/2, (viewHeight-imageHeight)/2, imageWidth, imageHeight)];

    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)imageFromString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [string drawInRect:CGRectMake(0, 0, size.width, size.height) withAttributes:attributes];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)generateNumberImage:(UIColor *)textColor
                            font:(UIFont *)textFont
                          number:(NSNumber *)number
                       imageSize:(CGSize)imageSize {
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentCenter;

    NSDictionary *attributes = @{NSFontAttributeName            : textFont,
                                 NSForegroundColorAttributeName : textColor,
                                 NSBackgroundColorAttributeName : [UIColor clearColor],
                                 NSParagraphStyleAttributeName: paragraphStyle};

    return [UIImage imageFromString:[number stringValue] attributes:attributes size:imageSize];
}

@end
