//
//  NSString+Predicate.m
//  sunvhui
//
//  Created by Xu on 2016/8/28.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "NSString+Predicate.h"

@implementation NSString (Predicate)

/**
 检查是否符合正则匹配的条件
 
 @param regex 正则条件
 @return 符合为YES,不符合为NO
 */
- (BOOL)predicateWithFormat:(NSString *)regex{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:self];
}

/**
 检查是否是合法的电话号码
 
 @return 符合为YES,不符合为NO
 */
- (BOOL)isValidMobileNumber{
    NSString *regex = @"^(0|86|17951)?(13[0-9]|15[012356789]|1[78][0-9]|14[57])[0-9]{8}$";
    return [self predicateWithFormat:regex];
}

/**
 是否是合法的验证码(根据自家的验证码位数进行修改)
 
 @return 符合为YES,不符合为NO
 */
- (BOOL)isValidVerifyCode{
    NSString *regex = @"^[0-9]{4}";
    return [self predicateWithFormat:regex];
}

/**
 是否是合法的邮箱地址
 
 @return 符合为YES,不符合为NO
 */
- (BOOL)isValidEmail{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self predicateWithFormat:regex];
}

/**
 是否是合法的银行卡号
 
 @return 符合为YES,不符合为NO
 */
- (BOOL)isValidBankCardNumber{
    
    if ([self integerValue] <= 0) {
        return NO;
    }
    
    // 奇数之和
    NSInteger oddSum = 0;
    // 偶数之和
    NSInteger evenSum = 0;
    // 总和
    NSInteger sum = 0;
    // 卡号长度
    NSInteger cardNumberLength = self.length;
    //
    NSInteger lastSum = [[self substringFromIndex:cardNumberLength - 1] integerValue];
    
    NSString *tempCardNumber = [self substringToIndex:cardNumberLength - 1];
    
    BOOL flag = cardNumberLength % 2;
    
    
    for (NSInteger i = cardNumberLength - 1; i >= 1; i--) {
        
        NSString *tempCardNo = [tempCardNumber substringWithRange:NSMakeRange(i - 1, 1)];
        NSInteger tempVal = [tempCardNo integerValue];
        
        
//        if (cardNumberLength % 2 == 1) {
//            
//            if ((i % 2) == 0) {
//                tempVal *= 2;
//                
//                if (tempVal >= 10) {
//                    tempVal -= 9;
//                }
//                evenSum += tempVal;
//                
//            } else {
//                oddSum += tempVal;
//            }
//            
//        } else {
//            
//            if (( i % 2) == 1) {
//                tempVal *= 2;
//                
//                if (tempVal >= 10) {
//                    tempVal -= 9;
//                }
//                evenSum += tempVal;
//            } else {
//                oddSum += tempVal;
//            }
//            
//        }
        
        
        if (( i % 2) != flag) {
            tempVal *= 2;
            
            if (tempVal >= 10) {
                tempVal -= 9;
            }
            evenSum += tempVal;
        } else {
            oddSum += tempVal;
        }
    }
    
    sum = oddSum + evenSum;
    sum += lastSum;
    
    return !(sum % 10);
}

/**
 是否是合法的身份证号码
 
 @return 符合为YES,不符合为NO
 */
- (BOOL) isValidIdentificationNumber{
    return [self isValidIdentifyFifteen] || [self isValidIdentifyEighteen];
}

/**
 15位身份证

 @return 符合为YES,不符合为NO
 */
- (BOOL)isValidIdentifyFifteen{
    NSString * identifyTest=@"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    return [self predicateWithFormat:identifyTest];
}

/**
 18位身份证

 @return 符合为YES,不符合为NO
 */
- (BOOL)isValidIdentifyEighteen{
    NSString * identifyTest=@"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$";
    return [self predicateWithFormat:identifyTest];
}

/**
 是否是合法的URL地址
 
 @return 符合为YES,不符合为NO
 */
- (BOOL) isValidURL{
    NSString *regex = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    return [self predicateWithFormat:regex];
}


@end
