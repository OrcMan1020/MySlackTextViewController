//
//  SLKInputActionButtonContainerView.h
//  Messenger-Programatic
//
//  Created by saix on 2017/10/10.
//  Copyright © 2017年 
//

#import <UIKit/UIKit.h>

@interface SLKInputActionButtonContainerView : UIView

@property (nonatomic, copy) NSString* title;
@property (nonatomic) BOOL enabled;
@property (nonatomic, readonly) UIButton* button;

-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSString*)title;
-(void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
@end
