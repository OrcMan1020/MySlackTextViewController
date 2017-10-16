//
//  SLKInputShortformLongformButton.h
//  Messenger-Programatic
//
//  Created by saix on 2017/10/10.
//  Copyright © 2017年 
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SLKInputShortform = 1,
    SLKInputLongform,
    
} SLKInputFormStyle;

@interface SLKInputShortformLongformButton : UIControl

@property (nonatomic) SLKInputFormStyle style;


@end
