//
//  CircleView.h
//  CircleIcon
//
//  Created by 吴迪 on 2017/3/11.
//  Copyright © 2017年 吴迪. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, SIIconFillType) {
    SIIconCross = 0,      //十字
    SIIconHorizontal = 1, //横线
    SIIconBlank = 2,      //空白
    
};
@interface CircleIcon : UIView

+ (CircleIcon *)instanceCircleIcon;
// SIIconFillType :2 只设置icon边界的颜色
+ (CircleIcon *)instanceCircleIconWithBorderColor:(UIColor *)borderColor;
// SIIconFillType : 0|1 设置icon填充的颜色和填充类型
+ (CircleIcon *)instanceCircleIconWithFillColor:(UIColor *)fillColor fillType:(SIIconFillType)iconFillType;
//所有属性都设置
+ (CircleIcon *)instanceCircleIconWithWidth:(CGFloat)circleIconRadius borderColor:(UIColor *)borderColor fillType:(SIIconFillType)iconFillType fillColor:(UIColor *)fillColor iconFillLineColor:(UIColor *)fillLineColor borderWidth:(CGFloat)borderWidth iconFillLineWidth:(CGFloat)iconFillLineWidth;
@end
