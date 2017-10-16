//
//  SLKNewInputAccessoryView.m
//  Messenger-Programatic
//
//  Created by saix on 2017/10/11.
//  Copyright © 2017年 
//

#import "SLKNewInputAccessoryView.h"

@implementation SLKNewInputAccessoryView

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self commonInit];
}

-(void)commonInit
{
    self.roundCorner.hidden = YES;
    
    NSArray* nibView = [[NSBundle mainBundle] loadNibNamed:@"SLKInputSelectionView" owner:nil options:nil];
    self.inputSelectionView = [nibView firstObject];
    [self.inputSelectionContainerView addSubview:self.inputSelectionView];
    self.inputSelectionView.translatesAutoresizingMaskIntoConstraints = NO;
    
    nibView = [[NSBundle mainBundle] loadNibNamed:@"SLKInputComposerView" owner:nil options:nil];
    self.inputComposerView = [nibView firstObject];
    [self.inputComposerContainerView addSubview:self.inputComposerView];
    [self setupViewConstraints];
    self.inputComposerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.inputType = SLKInputTypeInput;
}

-(SLKTextView*)textView
{
    return self.inputComposerView.textView;
}

-(SLKInputActionButtonContainerView*)sendButton
{
    return self.inputSelectionView.sendButton;
}

-(UIButton*)saveButton
{
    return self.inputSelectionView.saveButton;
}

-(UIButton*)cancelButton
{
    return self.inputSelectionView.cancelButton;
}

-(UIButton*)atMentionButton
{
    return self.inputSelectionView.atMentionButton;
}

-(UIButton*)slashCommandButton
{
    return self.inputSelectionView.slashCommandButton;
}

-(UIButton*)filesButton
{
    return self.inputSelectionView.filesButton;
}

-(UIButton*)photosButton
{
    return self.inputSelectionView.photosButton;
}

-(SLKInputShortformLongformButton*)formButton
{
    return self.inputComposerView.formButton;
}

-(UIView*)inputButtonsContainer
{
    return self.inputSelectionView.inputButtonsContainer;
}

-(UIView*)editButtonsContainer
{
    return self.inputSelectionView.editButtonsContainer;
}

-(void)setInputType:(SLKInputType)inputType
{
    _inputType = inputType;
    if (_inputType == SLKInputModeEdit) {
        self.editButtonsContainer.hidden = NO;
        self.inputButtonsContainer.hidden = YES;
    }
    else {
        self.editButtonsContainer.hidden = YES;
        self.inputButtonsContainer.hidden = NO;
    }
}

-(void)setInputComposerExpanded:(BOOL)expanded
{
    _inputComposerExpanded = expanded;
    self.roundCorner.hidden = !expanded;

    if (expanded) {
        self.textView.textContainerInset = UIEdgeInsetsMake(17+10, 11, 10, 41);
    }
    else {
        self.textView.textContainerInset = UIEdgeInsetsMake(10, 11, 10, 41);
    }
}

-(void)setupViewConstraints
{
    NSDictionary *views = @{@"inputSelectionView": self.inputSelectionView,
                            @"inputComposerView" : self.inputComposerView
                            };
    
    
    [self.inputSelectionContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[inputSelectionView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:views]];
    [self.inputSelectionContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[inputSelectionView]|"
                                                                                             options:0
                                                                                             metrics:nil
                                                                                               views:views]];
    
    [self.inputComposerContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[inputComposerView]|"
                                                                                             options:0
                                                                                             metrics:nil
                                                                                               views:views]];
    [self.inputComposerContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[inputComposerView]|"
                                                                                            options:0
                                                                                            metrics:nil
                                                                                              views:views]];

}
- (void)slk_commonInit
{
    // overwrite
    // do nothing
}
- (CGFloat)minimumInputbarHeight
{
    return 80.f;
}

- (CGFloat)appropriateHeight
{
    
//    if (self.inputComposerExpanded) {
//        return 450;
//    }
    
    CGFloat height = 0.0;
    CGFloat minimumHeight = [self minimumInputbarHeight];
    
    if (self.textView.numberOfLines == 1) {
        height = minimumHeight;
    }
    else if (self.textView.numberOfLines < self.textView.maxNumberOfLines) {
        height = [self slk_inputBarHeightForLines:self.textView.numberOfLines];
    }
    else {
        height = [self slk_inputBarHeightForLines:self.textView.maxNumberOfLines];
    }
    
    if (height < minimumHeight) {
        height = minimumHeight;
    }
    
    if (self.isEditing) {
        height += self.editorContentViewHeight;
    }
    
    return roundf(height);
}

- (CGFloat)slk_inputBarHeightForLines:(NSUInteger)numberOfLines
{
    CGFloat height = self.textView.intrinsicContentSize.height;
    height -= self.textView.font.lineHeight;
    height += roundf(self.textView.font.lineHeight*numberOfLines);
    
    height += self.inputSelectionViewHC.constant;
    return height;
}

@end
