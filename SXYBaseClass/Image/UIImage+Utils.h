//
//  UIImage+Utils.h
//  MIGUOA
//
//  Created by zhongyang on 15/12/1.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Utils)

/**
 *  生成纯色图片
 */
+ (UIImage *)createImageFromColor:(UIColor *)color;

/**
 *  缩放图片，按大小填充（非等比例缩放）
 */
+ (UIImage *)resizeImage:(UIImage *)image scaledToSize:(CGSize)newSize;

/**
 *  裁剪为方形图片
 */
+ (UIImage *)CropSqureImage:(UIImage *)image;

/**
 *  将图片缩放，圆角处理
 */
+ (UIImage *)roundedRectImageFromImage:(UIImage *)image size:(CGSize)imageSize withCornerRadius:(float)cornerRadius;
/*
 * 读取图片
 */
+ (UIImage *)pngImage:(NSString *)imageName;
+ (UIImage *)jpgImage:(NSString *)imageName;

/*
   生成默认的加载图片
*/
+ (UIImage *)generateDefalutImage:(UIColor *)backgroundColor
                   backgroundSize:(CGSize)backgroundSize
                     defaultImage:(UIImage *)defaultImage
                 defaultImageSize:(CGSize)defaultImageSize;

/*
   生成带数字的图片
*/
+ (UIImage *)generateNumberImage:(UIColor *)textColor
                            font:(UIFont *)textFont
                          number:(NSNumber *)number
                       imageSize:(CGSize)imageSize;

@end
