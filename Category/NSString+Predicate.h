//
//  NSString+Predicate.h
//  sunvhui
//
//  Created by Xu on 2016/8/28.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Predicate)

/**
 检查是否符合正则匹配的条件
 
 @param regex 正则条件
 @return 符合为YES,不符合为NO
 */
- (BOOL)predicateWithFormat:(NSString *)regex;

/**
 检查是否是合法的电话号码

 @return 符合为YES,不符合为NO
 */
- (BOOL)isValidMobileNumber;

/**
 是否是合法的验证码(根据自家的验证码位数进行修改)

 @return 符合为YES,不符合为NO
 */
- (BOOL)isValidVerifyCode;

/**
 是否是合法的邮箱地址

 @return 符合为YES,不符合为NO
 */
- (BOOL)isValidEmail;

/**
 是否是合法的银行卡号

 @return 符合为YES,不符合为NO
 */
- (BOOL)isValidBankCardNumber;


/**
 是否是合法的身份证号码

 @return 符合为YES,不符合为NO
 */
- (BOOL) isValidIdentificationNumber;

/**
 是否是合法的URL地址

 @return 符合为YES,不符合为NO
 */
- (BOOL) isValidURL;
@end
