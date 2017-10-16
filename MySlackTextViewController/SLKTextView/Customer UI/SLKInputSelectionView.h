//
//  SLKInputSelectionView.h
//  Messenger-Programatic
//
//  Created by saix on 2017/10/11.
//  Copyright © 2017年 
//

#import <UIKit/UIKit.h>
#import "SLKInputActionButtonContainerView.h"
#import "SLKInputSegmentedControl.h"

typedef enum : NSUInteger {
    SLKInputModeNomal,
    SLKInputModeEdit,
    
} SLKInputMode;

@interface SLKInputSelectionView : UIView
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet SLKInputActionButtonContainerView *sendButton;
@property (weak, nonatomic) IBOutlet SLKInputSegmentedControl *inputButtonsContainer;
@property (weak, nonatomic) IBOutlet UIView *editButtonsContainer;

@property (nonatomic) SLKInputMode inputMode;

@property (nonatomic, readonly) UIButton* atMentionButton;
@property (nonatomic, readonly) UIButton* slashCommandButton;
@property (nonatomic, readonly) UIButton* filesButton;
@property (nonatomic, readonly) UIButton* photosButton;



-(void)commonInit;


@end
