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
#import "PRToolbarControl.h"

// private
@interface PRFlyoutToolbar() 
@property(nonatomic) PRHandleControl *handleView;
@property(nonatomic) PRToolbarControl *toolbarControl;
@property(nonatomic) NSLayoutConstraint *widthConstraint;
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
  self.open = NO;
  [self sizeControl];
  self.clipsToBounds = YES;
  CALayer *layer = self.layer;
  layer.backgroundColor = [UIColor greenColor].CGColor;
  
  
  [self addHandle];
  [self addToolbar];
}


- (void)addToolbar {
  self.toolbarControl = [[PRToolbarControl alloc] init];
  self.toolbarControl.translatesAutoresizingMaskIntoConstraints = NO;
  self.translatesAutoresizingMaskIntoConstraints = NO;
  
  // setup intrinsic size
  NSLayoutConstraint *c1 =[NSLayoutConstraint
                           constraintWithItem:self
                           attribute:NSLayoutAttributeHeight
                           relatedBy:NSLayoutRelationEqual
                           toItem:nil
                           attribute:NSLayoutAttributeNotAnAttribute
                           multiplier:1.0
                           constant:30];
  
  self.widthConstraint =[NSLayoutConstraint
                         constraintWithItem:self
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:nil
                         attribute:NSLayoutAttributeNotAnAttribute
                         multiplier:1.0
                         constant:44];

  [self setWidthConstraints:40+40*[self.items count]];
  
  [self addConstraint:c1];
  [self addConstraint:self.widthConstraint];

}

- (void)setWidthConstraints:(CGFloat)width {
  DDLogInfo(@"setWidthConstraints:%f", width);
  
  [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews
                   animations:^{
                     self.widthConstraint.constant = width;
                     [self layoutIfNeeded];
                   }
                   completion:^(BOOL done){
                     
                   }];

  }

- (void)addHandle {
  self.handleView = [[PRHandleControl alloc] init];
  self.handleView.translatesAutoresizingMaskIntoConstraints = NO;
  
  [self setupHandleConstraints];
  
  __weak PRFlyoutToolbar *weakSelf = self;
  
  self.handleView.touchBlock = ^(UITouch *touch, UIEvent *event) {
    [weakSelf toggleOpen];
  };
  
  [self addSubview:self.handleView];
  self.handleView.backgroundColor = [UIColor redColor];
}

-(void)setupHandleConstraints {
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
  if (self.open) {
    //self.frameSize = CGSizeMake(160.0, 60.0);
    [self setWidthConstraints:40+80*[self.items count]];
  } else {
    [self setWidthConstraints:40];
  }
}

- (void)setItems:(NSArray *)items animated:(BOOL)animated {
  self.items = items;
  
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
