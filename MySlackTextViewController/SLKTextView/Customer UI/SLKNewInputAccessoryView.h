//
//  SLKNewInputAccessoryView.h
//  Messenger-Programatic
//
//  Created by saix on 2017/10/11.
//  Copyright © 2017年 
//

#import <UIKit/UIKit.h>
#import "SLKInputComposerView.h"
#import "SLKInputSelectionView.h"
#import "SLKRoundedCornerOverlayView.h"
#import "SLKTextInputbar.h"
#import "SLKInputShortformLongformButton.h"

#import "SLKInputSegmentedSubcontrol.h"

typedef enum : NSUInteger {
    SLKInputTypeInput,
    SLKInputTypeEdit,
    
} SLKInputType;

@interface SLKNewInputAccessoryView : SLKTextInputbar
@property (weak, nonatomic) IBOutlet UIView *inputComposerContainerView;
@property (strong, nonatomic) SLKInputComposerView *inputComposerView;
@property (weak, nonatomic) IBOutlet UIView *inputSelectionContainerView;
@property (strong, nonatomic) SLKInputSelectionView *inputSelectionView;
@property (weak, nonatomic) IBOutlet SLKRoundedCornerOverlayView *roundCorner;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputComposerViewHC;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *inputSelectionViewHC;


@property (nonatomic, readonly) SLKInputActionButtonContainerView* sendButton;
@property (nonatomic, readonly) UIButton* saveButton;
@property (nonatomic, readonly) UIButton* cancelButton;
@property (nonatomic, readonly) SLKInputSegmentedSubcontrol* atMentionButton;
@property (nonatomic, readonly) SLKInputSegmentedSubcontrol* slashCommandButton;
@property (nonatomic, readonly) SLKInputSegmentedSubcontrol* filesButton;
@property (nonatomic, readonly) SLKInputSegmentedSubcontrol* photosButton;
@property (nonatomic, readonly) SLKInputShortformLongformButton* formButton;

@property (nonatomic, readonly) UIView* editButtonsContainer;
@property (nonatomic, readonly) UIView* inputButtonsContainer;

@property (nonatomic) SLKInputType inputType;

@property (nonatomic) BOOL inputComposerExpanded;
-(void)commonInit;
@end
