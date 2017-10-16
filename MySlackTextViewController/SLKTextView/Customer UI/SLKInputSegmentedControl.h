//
//  SLKInputSegmentedControl.h
//  Messenger-Programatic
//
//  Created by saix on 2017/10/11.
//  Copyright © 2017年 
//

#import <UIKit/UIKit.h>

@interface SLKInputSegmentedControl : UIControl
-(instancetype)initWithFrame:(CGRect)frame
                 leftButtons:(NSArray*)leftButtons
                rightButtons:(NSArray*)rightButtons;

-(void)setLeftButtons:(NSArray*)leftButtons
         rightButtons:(NSArray*)rightButtons;

@end
