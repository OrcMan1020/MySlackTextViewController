//
//  SLKInputSegmentSubcontrol.h
//  Messenger-Programatic
//
//  Created by saix on 2017/10/10.
//  Copyright © 2017年 
//

#import <UIKit/UIKit.h>

@interface SLKInputSegmentedSubcontrol : UIControl

-(instancetype)initWithFrame:(CGRect)frame andImageName:(NSString*)imageName;
-(instancetype)initWithFrame:(CGRect)frame andImageName:(NSString*)imageName selectedImageName:(NSString*)selectedImageName;

@end
