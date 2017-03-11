//
//  CircleView.m
//  CircleIcon
//
//  Created by 吴迪 on 2017/3/11.
//  Copyright © 2017年 吴迪. All rights reserved.
//

#import "CircleView.h"
#define CircleIconWidth 16
#define SIBorderColor [UIColor grayColor]
#define IconFillType 2
#define FillColor [UIColor whiteColor]
#define IconFillLineWidth 1.5
#define IconFillLineColor [UIColor whiteColor]
#define BorderWidth 2

@implementation CircleIcon {
}
+ (CircleIcon *)instanceCircleIcon {
    return [CircleIcon instanceCircleIconWithBorderColor:SIBorderColor];
}

+ (CircleIcon *)instanceCircleIconWithBorderColor:(UIColor *)borderColor {
    return [CircleIcon instanceCircleIconWithWidth:CircleIconWidth
                                       borderColor:borderColor
                                          fillType:SIIconBlank
                                         fillColor:FillColor
                                 iconFillLineColor:FillColor
                                       borderWidth:BorderWidth
                                 iconFillLineWidth:IconFillLineWidth];
}

+ (CircleIcon *)instanceCircleIconWithFillColor:(UIColor *)fillColor fillType:(SIIconFillType)iconFillType {
    if (iconFillType == SIIconBlank) {
        return [CircleIcon instanceCircleIconWithBorderColor:fillColor];
    } else {
        return [CircleIcon instanceCircleIconWithWidth:CircleIconWidth
                                           borderColor:SIBorderColor
                                              fillType:iconFillType
                                             fillColor:fillColor
                                     iconFillLineColor:IconFillLineColor
                                           borderWidth:0
                                     iconFillLineWidth:IconFillLineWidth];
    }
}
+ (CircleIcon *)instanceCircleIconWithWidth:(CGFloat)circleIconWidth
                                borderColor:(UIColor *)borderColor
                                   fillType:(SIIconFillType)iconFillType
                                  fillColor:(UIColor *)fillColor
                          iconFillLineColor:(UIColor *)fillLineColor
                                borderWidth:(CGFloat)borderWidth
                          iconFillLineWidth:(CGFloat)iconFillLineWidth {
    CircleIcon *circleIcon = [[CircleIcon alloc] initWithFrame:CGRectMake(0, 0, circleIconWidth, circleIconWidth)];
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth / 2, borderWidth / 2,
                                                                                 circleIconWidth - borderWidth,
                                                                                 circleIconWidth - borderWidth)];
    borderPath.lineJoinStyle = kCGLineCapRound; //终点处理
    shapeLayer.path = borderPath.CGPath;
    shapeLayer.lineWidth = borderWidth;
    shapeLayer.fillColor = fillColor.CGColor;
    shapeLayer.strokeColor = borderColor.CGColor;
    [circleIcon.layer addSublayer:shapeLayer];
    if (iconFillType == SIIconHorizontal || iconFillType == SIIconCross) {
        CAShapeLayer *shapeLayer = [self lineWithWidth:circleIconWidth
                                     iconFillLineWidth:iconFillLineWidth
                                     iconFillLineColor:fillLineColor
                                         lineDirection:SIIconHorizontal];
        [circleIcon.layer addSublayer:shapeLayer];

        if (iconFillType == SIIconCross) {
            CAShapeLayer *shapeCross = [self lineWithWidth:circleIconWidth
                                         iconFillLineWidth:iconFillLineWidth
                                         iconFillLineColor:fillLineColor
                                             lineDirection:SIIconCross];
            [circleIcon.layer addSublayer:shapeCross];
        }
    }
    circleIcon.userInteractionEnabled = NO;
    return circleIcon;
}
+ (CAShapeLayer *)lineWithWidth:(CGFloat)circleIconWidth
              iconFillLineWidth:(CGFloat)iconFillLineWidth
              iconFillLineColor:(UIColor *)fillLineColor
                  lineDirection:(SIIconFillType)lineDirection {
    CAShapeLayer *shapeHorizontal = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    if (lineDirection == SIIconHorizontal) {
        [path moveToPoint:CGPointMake(7.0 / 32.0 * circleIconWidth, circleIconWidth / 2)];
        [path addLineToPoint:CGPointMake(25.0 / 32.0 * circleIconWidth, circleIconWidth / 2.0)];
    } else {
        [path moveToPoint:CGPointMake(circleIconWidth / 2.0, 7.0 / 32.0 * circleIconWidth)];
        [path addLineToPoint:CGPointMake(circleIconWidth / 2.0, 25.0 / 32.0 * circleIconWidth)];
    }
    shapeHorizontal.path = path.CGPath;
    shapeHorizontal.lineCap = kCALineCapButt;
    shapeHorizontal.lineWidth = iconFillLineWidth;
    shapeHorizontal.strokeColor = fillLineColor.CGColor;
    return shapeHorizontal;
}

@end
