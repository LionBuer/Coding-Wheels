//
//  NSString+Category.h
//  sunvhui
//
//  Created by Xu on 2016/8/28.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Category)

/**
 根据最大宽度和字体，获取文字合适的尺寸
 
 @param font 字体
 @param maxWidth 文字能显示的最大宽度
 @return 尺寸
 */
- (CGSize)xc_sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;


/**
 根据字体，获取文字合适的尺寸

 @param font 字体
 @return 尺寸
 */
- (CGSize)xc_sizeWithFont:(UIFont *)font;


/**
 根据最大宽度和字体，获取文字合适的高度

 @param font 字体
 @param maxWidth 文字能显示的最大宽度
 @return 尺寸
 */
- (CGFloat)xc_heightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;


/**
 根据字体，获取文字合适的高度

 @param font 字体
 @return 尺寸
 */
- (CGFloat)xc_heightWithFont:(UIFont *)font;

/* ============================================================================================================================================================================================================================================================================================ */

/**
 对字符串进行MD5加密

 @return MD5加密后的字符串
 */
- (NSString *)xc_md5String;

/**
 对字符串进行base64加密

 @return base64加密后的字符串
 */
- (NSString*)xc_base64EncodeString;

/**
 对字符串进行base64解密

 @return base64解密后的字符串
 */
- (NSString *)xc_base64DecodeString;

/**
 对字符串URL encode
 
 @return encodeURLString
 */
- (NSString *)xc_encodeURLString;

/**
 对字符串URL decode
 
 @return decodeURLString
 */
- (NSString *)xc_decodeURLString;

/* ============================================================================================================================================================================================================================================================================================ */

/**
 字符串转字典

 @return 转换后的字典
 */
- (NSDictionary *)xc_dictionary;


/**
 字符串转data

 @return 转换后的data
 */
- (NSData *)xc_data;
@end
