//
//  SLKInputActionButtonContainerView.m
//  Messenger-Programatic
//
//  Created by saix on 2017/10/10.
//  Copyright © 2017年 
//

#import "SLKInputActionButtonContainerView.h"

@interface SLKInputActionButtonContainerView(){
}

@property (nonatomic, strong) UIButton* button;


@end
@implementation SLKInputActionButtonContainerView


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

-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSString*)title
{
    self = [super initWithFrame:frame];
    if(self){
        [self commonInit];
        self.title = title;
    }
    return self;
}
#define _RGBCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



-(UIButton*)button
{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.titleLabel.font = [UIFont boldSystemFontOfSize:15.f];
        _button.translatesAutoresizingMaskIntoConstraints = NO;
        
        [_button setTitleColor:_RGBCOLOR(0xFFFFFF) forState:UIControlStateNormal];
        [_button setTitleColor:_RGBCOLOR(0xAAAAAC) forState:UIControlStateDisabled];
        _button.layer.borderColor = _RGBCOLOR(0xAAAAAC).CGColor;
        _button.layer.cornerRadius = 4.f;
        _button.clipsToBounds = YES;
        
        [self addSubview:_button];

    }
    return _button;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    [self.button setTitle:title forState:UIControlStateNormal];
}

-(void)commonInit
{
    [self setupViewConstraints];
    self.enabled = NO;

}
-(void)setupViewConstraints
{
#define kSpace 8.f
    
    NSDictionary *views = @{@"button": self.button,
                            };
    
    NSDictionary *metrics = @{@"left" : @(kSpace),
                              @"right" : @(kSpace),
                              };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[button]-right-|"
                                                                 options:0
                                                                 metrics:metrics
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=5)-[button(==30)]-(>=5)-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    
#undef kSpace
}



-(void)setEnabled:(BOOL)enabled
{
    _enabled = enabled;
    self.button.enabled = enabled;
    if (_enabled) {
        [self.button setBackgroundColor:_RGBCOLOR(0x2897E7)];
        self.button.layer.borderWidth = 0.f;
    }
    else {
        [self.button setBackgroundColor:_RGBCOLOR(0xFFFFFF)];
        self.button.layer.borderWidth = 1.f;
    }
    
}

-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    [self.button addTarget:target action:action forControlEvents:controlEvents];
}

@end
