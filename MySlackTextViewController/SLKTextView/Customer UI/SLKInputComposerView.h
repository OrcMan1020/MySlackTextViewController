//
//  SLKInputComposerView.h
//  Messenger-Programatic
//
//  Created by saix on 2017/10/11.
//  Copyright © 2017年 
//

#import <UIKit/UIKit.h>
#import "SLKTextView.h"
#import "SLKInputShortformLongformButton.h"
@interface SLKInputComposerView : UIView
@property (weak, nonatomic) IBOutlet UIView *hairLine;
@property (weak, nonatomic) IBOutlet SLKTextView *textView;
@property (weak, nonatomic) IBOutlet SLKInputShortformLongformButton *formButton;


-(void)commonInit;

@end
