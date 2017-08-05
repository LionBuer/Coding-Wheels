//
//  UIView+Category.h
//  sunvhui
//
//  Created by Xu on 2016/8/29.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)
/**
 从xib加载一个控件
 
 @return 这个类的一个控件对象
 */
+ (instancetype _Nullable)viewFromXib;
@end







@interface UIView (Animation)
/**
 点赞动画
 
 @param scaleValues 动画组，默认@[@(0.3),@(1.0),@(1.5)]
 */
- (void)showPraiseAnimationWithScaleValues:(NSArray <NSNumber *>*_Nullable)scaleValues;
@end




@interface UIView (ScreenShot)

/**
 View全屏截图

 @return 截图
 */
- (UIImage * _Nullable)screenshot;

/**
 View按Rect截图

 @param rect 截图矩形
 @return 截图
 */
- (UIImage * _Nullable)screenshotWithRect:(CGRect)rect;
@end
