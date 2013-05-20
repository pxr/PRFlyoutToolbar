//
//  PRHandleControl.m
//  PRFlyoutToolbar
//
//  Created by Paul Robinson on 2013-05-18.
//  Copyright (c) 2013 Elastic Rat. All rights reserved.
//


#import "PRHandleControl.h"

@interface PRHandleControl()
@property (nonatomic) UIImageView* imageView;
@end

@implementation PRHandleControl

// init will call initWithFrame with CGRectZero then HandleView will set its own size
-(id)initWithFrame:(CGRect)frame {
  DDLogInfo(@"initWithFrame:%@", NSStringFromCGRect(frame));
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = [UIColor blueColor];
    self.frame = CGRectMake(0, 0, 44, 44);
  }
  return self;
}


- (id)initWithImage:(UIImage*)handleImage frame:(CGRect)frame {
    TRACE
    self = [super init];
    if (self) {
      self.image = handleImage;
      [self setup];
    }
    return self;
}

- (void)setup {
  TRACE
  self.imageView = [[UIImageView alloc] initWithImage:self.image];
  self.imageView.center = self.center;
  DDLogInfo(@"handleview: %@", self);
  DDLogInfo(@"imageView: %@ layer:%@", self.imageView, self.imageView.layer);
  [self addSubview:self.imageView];
}


- (void)rotateHandleDegrees:(CGFloat)degrees {
  CGFloat radians = degrees * M_PI / 180.0;
  
  [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionLayoutSubviews
                   animations:^{
                     self.transform = CGAffineTransformRotate(self.transform, radians);
                   }
                   completion:^(BOOL done){
                     
                   }];
  
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
  TRACE
  if (self.touchBlock) {
    self.touchBlock(touch, event);
  }
  
  return YES;
}

@end
