//
//  PRFlyoutToolbar.m
//  PRFlyoutToolbar
//
//  Created by Paul Robinson on 2013-05-15.
//  Copyright (c) 2013 Elastic Rat. All rights reserved.
//

#import "PRFlyoutToolbar.h"
#import <QuartzCore/QuartzCore.h>

@implementation PRFlyoutToolbar


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      // Initialization code
      [self setupLayers];
    }
    return self;
}

- (void)setupLayers {
  NSLog(@"layer: %@", self.layer);
  CALayer *layer = self.layer;
  layer.backgroundColor = [UIColor blueColor].CGColor;
}


- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
  [super beginTrackingWithTouch:touch withEvent:event];
  
  self.layer.backgroundColor = [UIColor greenColor].CGColor;
  CGRect newFrame = CGRectInset(self.layer.bounds, 1, 1);
  
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];

  self.layer.bounds = newFrame;
  [self.layer addAnimation:animation forKey:@"bounds"];
  return YES;
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
