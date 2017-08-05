//
//  NSString+Category.m
//  sunvhui
//
//  Created by Xu on 2016/8/28.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Category)

/**
 根据最大宽度和字体，获取文字合适的尺寸
 
 @param font 字体
 @param maxWidth 文字能显示的最大宽度
 @return 尺寸
 */
- (CGSize)xc_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth{
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    
    CGSize size = CGSizeMake(maxWidth, CGFLOAT_MAX);
    
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:attrs context:nil].size;
}

/**
 根据字体，获取文字合适的尺寸
 
 @param font 字体
 @return 尺寸
 */
- (CGSize)xc_sizeWithFont:(UIFont *)font{
    return [self xc_sizeWithFont:font maxWidth:CGFLOAT_MAX];
}

/**
 根据最大宽度和字体，获取文字合适的高度
 
 @param font 字体
 @param maxWidth 文字能显示的最大宽度
 @return 尺寸
 */
- (CGFloat)xc_heightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth{
    return ceilf([self xc_sizeWithFont:font maxWidth:maxWidth].height);
}


/**
 根据字体，获取文字合适的高度
 
 @param font 字体
 @return 尺寸
 */
- (CGFloat)xc_heightWithFont:(UIFont *)font{
    return [self xc_heightWithFont:font maxWidth:CGFLOAT_MAX];
}

/* ============================================================================================================================================================================================================================================================================================ */

/**
 对字符串进行MD5加密
 
 @return MD5加密后的字符串
 */
- (NSString *)xc_md5String{
    
    if ([self isEqual:[NSNull null]] || !self || !self.length) {
        return nil;
    }
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (int)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return [[NSString stringWithString:outputString] lowercaseString];
    
}

/**
 对字符串进行base64加密
 
 @return base64加密后的字符串
 */
- (NSString*)xc_base64EncodeString{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
}

/**
 对字符串进行base64解密
 
 @return base64解密后的字符串
 */
- (NSString *)xc_base64DecodeString{
    return [[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:self options:0] encoding:NSUTF8StringEncoding];
}

/**
 对字符串URL encode

 @return encodeURLString
 */
- (NSString *)xc_encodeURLString{
    
//#pragma clang diagnostic push
//#pragma clang diagnostic ignored"-Wdeprecated-declarations"
//    return [NSURL URLWithString:(NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL,kCFStringEncodingUTF8))];
//#pragma clang diagnostic pop
    
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!$&'()*+,-./:;=?@_~%#[]"]];
}

/**
 对字符串URL decode
 
 @return decodeURLString
 */
- (NSString *)xc_decodeURLString{
    return [self stringByRemovingPercentEncoding];
}

/* ============================================================================================================================================================================================================================================================================================ */

/**
 字符串转字典
 
 @return 转换后的字典
 */
- (NSDictionary *)xc_dictionary{
    return [NSJSONSerialization JSONObjectWithData:[self xc_data] options:kNilOptions error:nil];
}


/**
 字符串转data
 
 @return 转换后的data
 */
- (NSData *)xc_data{
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

@end
