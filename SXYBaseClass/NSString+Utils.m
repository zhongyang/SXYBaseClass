//
//  NSString+Utils.m
//  MIGUOA
//
//  Created by zhongyang on 15/12/4.
//
//

#import "NSString+Utils.h"
#import "CocoaSecurity.h"
#import "NSData+Base64.h"
#include <CommonCrypto/CommonDigest.h>

#define ENCRYPT_KEY @"WOSHISHUIWOLAIZINAWOYAOQUNA"


@implementation NSString (Utils)

//计算文字Frame
- (CGSize)computeTextSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize {
    CGSize size = CGSizeZero;
    if ([self length] > 0) {
        NSMutableParagraphStyle *style  = [[NSMutableParagraphStyle alloc] init];
        style.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = [[NSDictionary alloc] initWithObjectsAndKeys:font, NSFontAttributeName, style, NSParagraphStyleAttributeName, nil];
        size = [self boundingRectWithSize:maxSize
                                  options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                               attributes:attributes
                                  context:nil].size;
    }
    size.width = ceilf(size.width);
    size.height = ceilf(size.height);
    return size;
}

- (NSString *)md5 {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), result );

    NSMutableString *hash = [NSMutableString string];
    for(int i=0;i<CC_MD5_DIGEST_LENGTH;i++)
    {
        [hash appendFormat:@"%02X",result[i]];
    }
    return [hash lowercaseString];
}

- (NSString *)base64 {
   return [[self dataUsingEncoding:NSUTF8StringEncoding] base64EncodedString];
}

- (NSString *)encryptString {
    CocoaSecurityResult * result = [CocoaSecurity aesEncrypt:self key:ENCRYPT_KEY];
    if (result) {
        return result.base64;
    } else {
        NSLog(@"Encrypt string failed");
    }
    return nil;
}

- (NSString *)decryptString {
    CocoaSecurityResult * result = [CocoaSecurity aesDecryptWithBase64:self key:ENCRYPT_KEY];
    if (result) {
        return result.utf8String;
    } else {
        NSLog(@"Decrypt string failed");
    }
    return nil;
}

- (BOOL)isEnglishOrNumberCharacter {
    NSString* regex = @"^[A-Za-z0-9]+$";
    NSPredicate* regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [regexTest evaluateWithObject:self];
}

@end
