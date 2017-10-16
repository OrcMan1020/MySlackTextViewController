//
//  SLKRoundedCornerOverlayView.m
//  Messenger-Programatic
//
//  Created by saix on 2017/10/10.
//  Copyright © 2017年
//

#import "SLKRoundedCornerOverlayView.h"

@implementation SLKRoundedCornerOverlayView

-(void)awakeFromNib
{
    [super awakeFromNib];
//    self.layer.cornerRadius = 4.f;
//    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor clearColor];
}

-(instancetype)init
{
    self = [super init];
    if (self) {
//        self.layer.cornerRadius = 4.f;
        self.backgroundColor = [UIColor clearColor];

    }
    
    return self;
}
#define _RGBCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
#define kWidth 12.f
#define kHeight 12.f

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    [[UIColor blackColor] setFill];
    // left
    {
        UIBezierPath * path = [[UIBezierPath alloc] init];
        CGPoint p = CGPointMake(0, kHeight);
        [path moveToPoint:p];
        
        p.y = 0;
        p.x = kWidth;
        [path addQuadCurveToPoint:p controlPoint:CGPointMake(0, 0)];
        
        
        p.x = 0;
        [path addLineToPoint: p];
        
        [path closePath];
        [path fill];
    }
    // right
    {
        UIBezierPath * path = [[UIBezierPath alloc] init];
        CGPoint p = CGPointMake(rect.size.width, kHeight);
        [path moveToPoint:p];
        
        p.y = 0;
        p.x = rect.size.width - kWidth;
        [path addQuadCurveToPoint:p controlPoint:CGPointMake(rect.size.width, 0)];
        
        p.x = rect.size.width;
        [path addLineToPoint: p];
        
        [path closePath];
        [path fill];
    }
    
    CGContextRestoreGState(context);

    
}

@end
