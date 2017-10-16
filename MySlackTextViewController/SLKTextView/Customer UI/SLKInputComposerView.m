//
//  SLKInputComposerView.m
//  Messenger-Programatic
//
//  Created by saix on 2017/10/11.
//  Copyright © 2017年 
//

#import "SLKInputComposerView.h"

@implementation SLKInputComposerView
#define _RGBCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self commonInit];

}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super initWithCoder:decoder])) {
        [self commonInit];
        
    }
    return self;
}



-(void)commonInit
{
    self.hairLine.backgroundColor = _RGBCOLOR(0xdbdbdb);
    _textView.font = [UIFont systemFontOfSize:16.0];
    _textView.maxNumberOfLines = 6;
    
//    _textView.keyboardType = UIKeyboardTypeTwitter;
    _textView.returnKeyType = UIReturnKeyDefault;
    _textView.enablesReturnKeyAutomatically = YES;
    _textView.scrollIndicatorInsets = UIEdgeInsetsMake(0.0, -1.0, 0.0, 1.0);
    _textView.textContainerInset = UIEdgeInsetsMake(10, 11, 10, 41);
    
//    [self.formButton addTarget:self action:@selector(clickedFormButton:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)clickedFormButton:(id)sender
{
    
}

@end
