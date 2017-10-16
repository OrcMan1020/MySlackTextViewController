//
//  SLKInputSelectionView.m
//  Messenger-Programatic
//
//  Created by saix on 2017/10/11.
//  Copyright © 2017年 
//

#import "SLKInputSelectionView.h"
#import "SLKInputActionButtonContainerView.h"
#import "SLKInputSegmentedControl.h"
#import "SLKInputSegmentedSubcontrol.h"

@interface SLKInputSelectionView()
@property (nonatomic, strong) UIButton* atMentionButton;
@property (nonatomic, strong) UIButton* slashCommandButton;
@property (nonatomic, strong) UIButton* filesButton;
@property (nonatomic, strong) UIButton* photosButton;

@end


@implementation SLKInputSelectionView
#define _RGBCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    [self commonInit];
    
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super initWithCoder:decoder])) {
        [self commonInit];
        
    }
    return self;
}

-(void)commonInit
{
    
    [self.saveButton setTitleColor:_RGBCOLOR(0xFFFFFF) forState:UIControlStateNormal];
    [self.saveButton setBackgroundColor:_RGBCOLOR(0x2897E7)];
    self.saveButton.layer.cornerRadius = 4.f;
    self.saveButton.clipsToBounds = YES;

    [self.cancelButton setTitleColor:_RGBCOLOR(0x2897E7) forState:UIControlStateNormal];
    
    self.sendButton.title = @"Send";
    
    self.atMentionButton = [[SLKInputSegmentedSubcontrol alloc] initWithFrame:CGRectMake(20, 150, 44, 40) andImageName:@"input-at" selectedImageName:@"input-at-selected"];
    [self.atMentionButton addTarget:self action:@selector(didTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.slashCommandButton = [[SLKInputSegmentedSubcontrol alloc] initWithFrame:CGRectMake(20, 150, 44, 40) andImageName:@"input-slash" selectedImageName:@"input-slash-selected"];
    [self.slashCommandButton addTarget:self action:@selector(didTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.filesButton = [[SLKInputSegmentedSubcontrol alloc] initWithFrame:CGRectMake(20, 150, 44, 40) andImageName:@"input-documents" selectedImageName:@"input-documents-selected"];
    [self.filesButton addTarget:self action:@selector(didTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.photosButton = [[SLKInputSegmentedSubcontrol alloc] initWithFrame:CGRectMake(20, 150, 44, 40) andImageName:@"input-photos" selectedImageName:@"input-photos-selected"];
    [self.photosButton addTarget:self action:@selector(didTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.inputButtonsContainer setLeftButtons:@[self.atMentionButton, self.slashCommandButton, self.filesButton] rightButtons:@[self.photosButton]];
    
    self.editButtonsContainer.hidden = YES;
}

-(void)didTapped:(id)sender
{
    self.sendButton.enabled = !self.sendButton.enabled;
}

-(void)setupViewConstraints
{
    
}


@end
