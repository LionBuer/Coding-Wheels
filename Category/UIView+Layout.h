//
//  UIView+Layout.h
//  sunvhui
//
//  Created by Xu on 2016/8/29.
//  Copyright © 2016年 Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Layout)

@property (nonatomic, assign) CGFloat xc_left;
@property (nonatomic, assign) CGFloat xc_right;
@property (nonatomic, assign) CGFloat xc_top;
@property (nonatomic, assign) CGFloat xc_bottom;

@property (nonatomic, assign) CGFloat xc_x;
@property (nonatomic, assign) CGFloat xc_y;
@property (nonatomic, assign) CGFloat xc_width;
@property (nonatomic, assign) CGFloat xc_height;

@property (nonatomic, assign) CGFloat xc_centerX;
@property (nonatomic, assign) CGFloat xc_centerY;


@property (nonatomic, assign) CGSize xc_size;
@property (nonatomic, assign) CGPoint xc_origin;

@end
