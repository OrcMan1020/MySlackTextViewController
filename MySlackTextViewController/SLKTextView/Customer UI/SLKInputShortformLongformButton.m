//
//  SLKInputShortformLongformButton.m
//  Messenger-Programatic
//
//  Created by saix on 2017/10/10.
//  Copyright © 2017年 
//

#import "SLKInputShortformLongformButton.h"

@interface SLKInputShortformLongformButton()
{
    UIImageView* leftArrow;
    UIImageView* rightArrow;
    
    __weak id _touchUpInsideTaget;
    SEL _touchUpInsideAction;
}

@end


@implementation SLKInputShortformLongformButton

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self commonInit];
}

-(instancetype)init
{
    self = [super init];
    if(self){
        [self commonInit];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self commonInit];
    }
    return self;
}

#define _RGBCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

-(void)commonInit
{
    self.tintColor = _RGBCOLOR(0x888888);
    
    leftArrow = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"longform-trigger-arrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    rightArrow = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"longform-trigger-arrow"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];

    leftArrow.translatesAutoresizingMaskIntoConstraints = NO;
    rightArrow.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:leftArrow];
    [self addSubview:rightArrow];
    
    self.style = SLKInputShortform;
    
    [self setupViewConstraints];
}

-(void)setStyle:(SLKInputFormStyle)style
{
    if (_style == style) {
        return;
    }
    _style = style;
    if (style == SLKInputShortform) {
        leftArrow.transform = CGAffineTransformMakeRotation(0);
        rightArrow.transform = CGAffineTransformMakeRotation((180.0 * M_PI) / 180.0);
    }
    else {
        rightArrow.transform = CGAffineTransformMakeRotation(0);
        leftArrow.transform = CGAffineTransformMakeRotation((180.0 * M_PI) / 180.0);
    }
}

-(void)setupViewConstraints
{
#define kSpace 3.f
#define kWidthAndHight 7.f
    
    NSDictionary *views = @{@"leftArrow": leftArrow,
                            @"rightArrow": rightArrow,
                            };
    
    NSDictionary *metrics = @{@"left" : @(0),
                              @"right" : @(0),
                              @"top" : @(0),
                              @"bottom" : @(0),
                              @"space" : @(kSpace),
                              @"width" : @(kWidthAndHight),
                              @"height" : @(kWidthAndHight)
                              };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[leftArrow(==width)]-space-[rightArrow(==width)]-right-|"
                                                                 options:0
                                                                 metrics:metrics
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[rightArrow(==height)]-space-[leftArrow(==height)]-bottom-|"
                                                                 options:0
                                                                 metrics:metrics
                                                                   views:views]];
    
#undef kSpace
#undef kWidthAndHight
}

-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    if (controlEvents & UIControlEventTouchUpInside) {
        _touchUpInsideAction = action;
        _touchUpInsideTaget = target;
        [super addTarget:self action:@selector(wrappedAction:) forControlEvents:controlEvents];
    }
    else {
        [super addTarget:target action:action forControlEvents:controlEvents];
    }
}

-(void)wrappedAction:(id)sender
{
    if (self.style == SLKInputShortform) {
        self.style = SLKInputLongform;
    }
    else {
        self.style = SLKInputShortform;
    }
    
    if (_touchUpInsideTaget && _touchUpInsideAction) {
        if ([_touchUpInsideTaget respondsToSelector:_touchUpInsideAction]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [_touchUpInsideTaget performSelector:_touchUpInsideAction withObject:sender];
#pragma clang diagnostic pop

        }
    }
}

@end
