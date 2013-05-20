//
//  PRFlyoutToolbar.m
//  PRFlyoutToolbar
//
//  Created by Paul Robinson on 2013-05-15.
//  Copyright (c) 2013 Elastic Rat. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>

#import "PRCategoryKit.h"
#import "PRFlyoutToolbar.h"
#import "PRHandleControl.h"

// private
@interface PRFlyoutToolbar() 
@property(nonatomic) PRHandleControl *handleView;
//@property(nonatomic) PRToolBarControl *toolbarControl;
@end


@implementation PRFlyoutToolbar


#pragma mark -
#pragma mark init
- (id)initWithFrame:(CGRect)frame
{
  TRACE
  self = [super initWithFrame:frame];
  if (self) {
    [self sharedInit];
  }
  return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
  TRACE
  self = [super initWithCoder:aDecoder];
  if (self) {
    [self sharedInit];
  }
  return self;
}

- (void)sharedInit {
  TRACE
  [self sizeControl];
  self.clipsToBounds = YES;
  CALayer *layer = self.layer;
  layer.backgroundColor = [UIColor greenColor].CGColor;
  
  [self setupConstraints];
  [self addHandle];
  
}

- (void)setupConstraints {
  
  // We want the control to size itself to be the width of the handle
  // and the tool bar
  
}

- (void)addHandle {
  self.handleView = [[PRHandleControl alloc] init];
  self.handleView.translatesAutoresizingMaskIntoConstraints = NO;
  
  // setup intrinsic size  
  NSLayoutConstraint *c1 =[NSLayoutConstraint
                                     constraintWithItem:self.handleView
                                     attribute:NSLayoutAttributeHeight
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:nil
                                     attribute:NSLayoutAttributeNotAnAttribute
                                     multiplier:1.0
                                     constant:20];
  
  NSLayoutConstraint *c2 =[NSLayoutConstraint
                           constraintWithItem:self.handleView
                           attribute:NSLayoutAttributeWidth
                           relatedBy:NSLayoutRelationEqual
                           toItem:nil
                           attribute:NSLayoutAttributeNotAnAttribute
                           multiplier:1.0
                           constant:20];

  NSLayoutConstraint *c3 =[NSLayoutConstraint
                                     constraintWithItem:self.handleView
                                     attribute:NSLayoutAttributeCenterY
                                     relatedBy:NSLayoutRelationEqual
                                     toItem:self
                                     attribute:NSLayoutAttributeCenterY
                                     multiplier:1.0
                                     constant:0];
  
  NSLayoutConstraint *c4 =[NSLayoutConstraint
                           constraintWithItem:self.handleView
                           attribute:NSLayoutAttributeRight
                           relatedBy:NSLayoutRelationLessThanOrEqual
                           toItem:self
                           attribute:NSLayoutAttributeRight
                           multiplier:1.0
                           constant:-5];
 
  [self addConstraint:c3];
  [self addConstraint:c4];
  [self addConstraint:c1];
  [self addConstraint:c2];
  
  __weak PRFlyoutToolbar *weakSelf = self;
  
  self.handleView.touchBlock = ^(UITouch *touch, UIEvent *event) {
    [weakSelf toggleOpen];
  };
  
  [self addSubview:self.handleView];
  
  //self.handleView.userInteractionEnabled = NO;
  self.handleView.backgroundColor = [UIColor redColor];
  DDLogInfo(@"self.handleView:%@", self.handleView);
  DDLogInfo(@"self:%@", self);

  
}

#pragma mark -
#pragma mark Touch Handling
- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
  TRACE
  [super beginTrackingWithTouch:touch withEvent:event];
  
  return YES;
}


- (void)sizeControl {
  TRACE
  if (!self.open) {
    self.frameSize = CGSizeMake(160.0, 60.0);
  } else {
    //self.frameSize = CGSizeMake(200.0, 30.0);
  }
}

- (void)setItems:(NSArray *)items animated:(BOOL)animated {
  
}

- (void)setOpen:(BOOL)open {
  TRACE
  if (open == _open) return;
  
  if (_open == NO) {
    [self openToolbar];
  } else {
    [self closeToolbar];
  }
}

- (void)openToolbar {
  TRACE
  _open = YES;
  [self.handleView rotateHandleDegrees:90];
  [self sizeControl];
}

- (void)closeToolbar {
  TRACE
  _open = NO;
  [self.handleView rotateHandleDegrees:-90];
  [self sizeControl];
}




- (void)toggleOpen {
  [self setOpen:!self.open];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
