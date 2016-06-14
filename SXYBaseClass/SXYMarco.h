//
//  SXYMarco.h
//  MIGUOA
//
//  Created by zhongyang on 15/12/1.
//
//

#ifndef SXYMarco_h
#define SXYMarco_h

#pragma mark - Exception

#define __throw_expection(errorstring) \
    @throw [NSException exceptionWithName:NSInternalInconsistencyException \
                                   reason:errorstring \
                                 userInfo:nil]; \

#pragma mark - Color

#define SXYRGBA(r,g,b,a) \
    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define SXYRGB(r,g,b) \
    SXYRGBA(r,g,b,1)



#pragma mark - LOG

#define __log_location \
    NSLog(@"ZHONGYANG %s:%d", __func__, __LINE__)




#pragma mark - GCD

#define __main_thread(_block_) \
    dispatch_async(dispatch_get_main_queue(), _block_)

#define __background_thread(_block_) \
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), _block_)

#define __weak_self     __typeof__(self) __weak weakself = self;
#define __strong_self   __strong __typeof(weakself) strongSelf = weakself

#define __object_block_return(block, object) \
    if(block) { \
        block(object); \
    } \

#define __void_block_return(block)  \
    if(block) { \
        block(); \
    } \

#define __bool_block_return(block, bool_value)  \
    if(block) { \
        block(bool_value); \
    } \


#pragma mark - String Operation

#define __trim_space(string) \
    ([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]])

#define __trim_space_line(string) \
    ([string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]])

#define __localize(key) \
    NSLocalizedStringFromTable(key, @"Localizable", nil)

#pragma mark File Operation

#define __document_path \
    ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0])

#define __create_dir(path, isDir, attrs, create_error) \
    ([[NSFileManager defaultManager] createDirectoryAtPath:path \
    withIntermediateDirectories:isDir \
    attributes:attrs \
    error:&create_error])

#define __file_exist(filePath) \
    ([[NSFileManager defaultManager] fileExistsAtPath:filePath])

#define __file_size(filePath) \
    ([[[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil][NSFileSize] longLongValue])

#pragma mark - Theme

#define _theme_color SXYRGB(234.0f, 76.0f, 137.0f)

#endif /* SXYMarco_h */
