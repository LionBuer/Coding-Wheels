//
//  UIView+Layout.m
//  sunvhui
//
//  Created by Xu on 2016/8/29.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import "UIView+Layout.h"

@implementation UIView (Layout)

- (CGFloat)xc_left{
    return self.xc_x;
}

- (void)setXc_left:(CGFloat)xc_left{
    self.xc_x = xc_left;
}

- (CGFloat)xc_top{
    return self.xc_y;
}

- (void)setXc_top:(CGFloat)xc_top{
    self.xc_y = xc_top;
}

- (CGFloat)xc_right{
    return self.xc_x + self.xc_width;
}

- (void)setXc_right:(CGFloat)xc_right{
    CGRect frame = self.frame;
    frame.origin.x = xc_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)xc_bottom{
    return self.xc_y + self.xc_height;
}

- (void)setXc_bottom:(CGFloat)xc_bottom{
    CGRect frame = self.frame;
    frame.origin.y = xc_bottom - frame.size.height;
    self.frame = frame;
}



- (CGFloat)xc_x{
    return self.frame.origin.x;
}

- (void)setXc_x:(CGFloat)xc_x{
    CGRect frame = self.frame;
    frame.origin.x = xc_x;
    self.frame = frame;
}

- (CGFloat)xc_y{
    return self.frame.origin.y;
}

- (void)setXc_y:(CGFloat)xc_y{
    CGRect frame = self.frame;
    frame.origin.y = xc_y;
    self.frame = frame;
}

- (CGFloat)xc_width{
    return self.frame.size.width;
}

- (void)setXc_width:(CGFloat)xc_width{
    CGRect frame = self.frame;
    frame.size.width = xc_width;
    self.frame = frame;
}

- (CGFloat)xc_height{
    return self.frame.size.height;
}

- (void)setXc_height:(CGFloat)xc_height{
    CGRect frame = self.frame;
    frame.size.height = xc_height;
    self.frame = frame;
}



- (CGFloat)xc_centerX{
    return self.center.x;
}

- (void)setXc_centerX:(CGFloat)xc_centerX{
    self.center = CGPointMake(xc_centerX, self.center.y);
}

- (CGFloat)xc_centerY{
    return self.center.y;
}

- (void)setXc_centerY:(CGFloat)xc_centerY{
    self.center = CGPointMake(self.center.x, xc_centerY);
}

- (CGSize)xc_size{
    return self.frame.size;
}

- (void)setXc_size:(CGSize)xc_size{
    CGRect frame = self.frame;
    frame.size = xc_size;
    self.frame = frame;
}

- (CGPoint)xc_origin{
    return self.frame.origin;
}

- (void)setXc_origin:(CGPoint)xc_origin{
    CGRect frame = self.frame;
    frame.origin = xc_origin;
    self.frame = frame;
}

@end
