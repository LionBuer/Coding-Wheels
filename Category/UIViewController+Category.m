//
//  UIViewController+Category.m
//  test
//
//  Created by Xu on 2017/6/15.
//  Copyright © 2017年 Xu. All rights reserved.
//

#import "UIViewController+Category.h"
#import <objc/runtime.h>

static char nameWithSetterGetterKey;

@implementation UIViewController (Category)


- (void)setNameWithSetterGetter:(NSString *)nameWithSetterGetter{
    NSLog(@"%@",nameWithSetterGetter);
    objc_setAssociatedObject(self, &nameWithSetterGetterKey, nameWithSetterGetter, OBJC_ASSOCIATION_COPY);
}

- (NSString *)nameWithSetterGetter{
    return objc_getAssociatedObject(self, &nameWithSetterGetterKey);
}



//- (void)programCategoryMethod{
//    
//}

@end
