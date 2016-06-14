//
//  NSString+Utils.h
//  MIGUOA
//
//  Created by zhongyang on 15/12/4.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

- (CGSize)computeTextSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

- (NSString *)md5;
- (NSString *)base64;

- (NSString *)encryptString;
- (NSString *)decryptString;

- (BOOL)isEnglishOrNumberCharacter;

@end
