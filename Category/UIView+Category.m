//
//  UIView+Category.m
//  sunvhui
//
//  Created by Xu on 2016/8/29.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)
/**
 从xib加载一个控件
 
 @return 这个类的一个控件对象
 */
+ (instancetype _Nullable)viewFromXib{
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}
@end






@implementation UIView (Animation)

/**
 点赞动画

 @param scaleValues 动画组，默认@[@(0.3),@(1.0),@(1.5)]
 */
- (void)showPraiseAnimationWithScaleValues:(NSArray <NSNumber *>*)scaleValues{
    
    if (!scaleValues || !scaleValues.count) {
        scaleValues = @[@(0.3),@(1.0),@(1.5)];
    }
    
    CAKeyframeAnimation *praiseAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    
    praiseAnimation.values = scaleValues;

    praiseAnimation.calculationMode = kCAAnimationPaced;
    
    [self.layer addAnimation:praiseAnimation forKey:@"praiseAnimation"];
}

@end



@implementation UIView (ScreenShot)

/**
 View全屏截图
 
 @return 截图
 */
- (UIImage * _Nullable)screenshot{
    
    UIImage* screenshotImg = nil;
    
    if ([self isKindOfClass:[UIScrollView class]]) {
        
        UIScrollView *scrollView = (UIScrollView *)self;
        
//        UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, NO, 0.0);
//        {
//            CGPoint savedContentOffset = scrollView.contentOffset;
//            CGRect savedFrame = scrollView.frame;
//            
//            scrollView.contentOffset = CGPointZero;
//            
//            scrollView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height);
//            
//            [scrollView.layer renderInContext:UIGraphicsGetCurrentContext()];
//            
//            screenshotImg = UIGraphicsGetImageFromCurrentImageContext();
//            
//            scrollView.contentOffset = savedContentOffset;
//            scrollView.frame = savedFrame;
//        }
//        UIGraphicsEndImageContext();
        
        
        UIGraphicsBeginImageContext(self.bounds.size);
        //need to translate the context down to the current visible portion of the scrollview
        CGContextTranslateCTM(UIGraphicsGetCurrentContext(), 0.0f, -scrollView.contentOffset.y);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        screenshotImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // helps w/ our colors when blurring
        // feel free to adjust jpeg quality (lower = higher perf)
        NSData *imageData = UIImageJPEGRepresentation(screenshotImg, 0.75);
        screenshotImg = [UIImage imageWithData:imageData];
        
    }else{
        
        UIGraphicsBeginImageContext(self.bounds.size);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        screenshotImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // helps w/ our colors when blurring
        // feel free to adjust jpeg quality (lower = higher perf)
        NSData *imageData = UIImageJPEGRepresentation(screenshotImg, 0.75);
        
        screenshotImg = [UIImage imageWithData:imageData];
        
    }
    return screenshotImg;
}


/**
 View按Rect截图
 
 @param rect 截图矩形
 @return 截图
 */
- (UIImage * _Nullable)screenshotWithRect:(CGRect)rect{
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextTranslateCTM(UIGraphicsGetCurrentContext(), rect.origin.x, rect.origin.y);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // helps w/ our colors when blurring
    // feel free to adjust jpeg quality (lower = higher perf)
    NSData *imageData = UIImageJPEGRepresentation(image, 0.75);
    image = [UIImage imageWithData:imageData];
    
    return image;
}



@end








