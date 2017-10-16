//
//  SLKInputSegmentSubcontrol.m
//  Messenger-Programatic
//
//  Created by saix on 2017/10/10.
//  Copyright © 2017年 
//

#import "SLKInputSegmentedSubcontrol.h"


@interface SLKInputSegmentedSubcontrol()
{
    UIImageView* imageView;
    NSString* _imageName;
    NSString* _selectedImageName;
    
    __weak id _touchUpInsideTaget;
    SEL _touchUpInsideAction;
}

@end

@implementation SLKInputSegmentedSubcontrol

-(instancetype)initWithFrame:(CGRect)frame andImageName:(NSString*)imageName
{
    return [self initWithFrame:frame andImageName:imageName selectedImageName:nil];
}

-(instancetype)initWithFrame:(CGRect)frame andImageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName
{
    self = [super initWithFrame:frame];
    if(self){
        _imageName = imageName;
        _selectedImageName = selectedImageName;
        [self commonInit];
    }
    return self;
}

#define _RGBCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

-(void)commonInit
{
    imageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:_imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [imageView sizeToFit];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addSubview:imageView];
    [self setupViewConstraints];
    self.tintColor = _RGBCOLOR(0xAAAAAC);
}

-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    
    if (_selectedImageName.length == 0) {
        // do nothing
        return;
    }

    if (selected) {
        self.tintColor = _RGBCOLOR(0x2897E7);
        imageView.image = [[UIImage imageNamed:_selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

    }
    else {
        self.tintColor = _RGBCOLOR(0xAAAAAC);
        imageView.image = [[UIImage imageNamed:_imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
}

-(void)setupViewConstraints
{

    [self addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
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
    self.selected = !self.selected;
    
    if (_selectedImageName.length == 0) {
        //
    }
    else {
        if (self.selected) {
            imageView.image = [[UIImage imageNamed:_selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
        else {
            imageView.image = [[UIImage imageNamed:_imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        }
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
