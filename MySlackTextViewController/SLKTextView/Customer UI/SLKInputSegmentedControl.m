//
//  SLKInputSegmentedControl.m
//  Messenger-Programatic
//
//  Created by saix on 2017/10/11.
//  Copyright © 2017年 
//

#import "SLKInputSegmentedControl.h"
#import "SLKInputSegmentedSubcontrol.h"


@interface SLKInputSegmentedControl()

@property (nonatomic, copy) NSArray* leftButtons;
@property (nonatomic, copy) NSArray* rightButtons;

@property (nonatomic, strong) UIStackView* leftStackView;
@property (nonatomic, strong) UIStackView* rightStackView;


@end


@implementation SLKInputSegmentedControl

-(instancetype)initWithFrame:(CGRect)frame leftButtons:(NSArray*)leftButtons rightButtons:(NSArray*)rightButtons
{
    self = [super initWithFrame:frame];
    if (self) {
        self.leftButtons = leftButtons;
        self.rightButtons = rightButtons;
        [self commonInit];
    }
    
    return self;
}

-(UIStackView*)leftStackView
{
    if (!_leftStackView) {
        _leftStackView = [[UIStackView alloc] init];
        [self addSubview:_leftStackView];
        
        _leftStackView.axis = UILayoutConstraintAxisHorizontal;
        _leftStackView.distribution = UIStackViewDistributionFillEqually;
        _leftStackView.spacing = 0;
        _leftStackView.alignment = UIStackViewAlignmentFill;
        _leftStackView.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    return _leftStackView;
}

-(UIStackView*)rightStackView
{
    if (!_rightStackView) {
        _rightStackView = [[UIStackView alloc] init];
        [self addSubview:_rightStackView];
        
        _rightStackView.axis = UILayoutConstraintAxisHorizontal;
        _rightStackView.distribution = UIStackViewDistributionFillEqually;
        _rightStackView.spacing = 0;
        _rightStackView.alignment = UIStackViewAlignmentFill;
        _rightStackView.translatesAutoresizingMaskIntoConstraints = NO;

    }
    
    return _rightStackView;
}

-(void)setLeftButtons:(NSArray*)leftButtons
         rightButtons:(NSArray*)rightButtons
{
    for (UIView* view in self.leftButtons) {
        [self.leftStackView removeArrangedSubview:view];
    }
    for (UIView* view in self.rightButtons) {
        [self.rightStackView removeArrangedSubview:view];
    }
    
    self.leftButtons = leftButtons;
    self.rightButtons = rightButtons;

    [self commonInit];
}


-(void)commonInit
{
    for (UIView* view in self.leftButtons) {
        [self.leftStackView addArrangedSubview:view];
    }
    for (UIView* view in self.rightButtons) {
        [self.rightStackView addArrangedSubview:view];
    }

    [self setupViewConstraints];

}

-(void)setupViewConstraints
{
    NSDictionary *views = @{@"leftStackView": self.leftStackView,
                            @"rightStackView": self.rightStackView,
                            };
    
    NSDictionary *metrics = @{@"leftStackViewWidth" : @(44 * self.leftButtons.count),
                              @"rightStackViewWidth" : @(44 * self.rightButtons.count),
                              };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[leftStackView(==leftStackViewWidth)]-(>=0)-[rightStackView(==rightStackViewWidth)]-0-|"
                                                                 options:0
                                                                 metrics:metrics
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[leftStackView]-0-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[rightStackView]-0-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
}

@end
