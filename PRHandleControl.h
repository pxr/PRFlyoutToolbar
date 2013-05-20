//
//  PRHandleControl.h
//  PRFlyoutToolbar
//
//  Created by Paul Robinson on 2013-05-18.
//  Copyright (c) 2013 Elastic Rat. All rights reserved.
//

typedef void(^TrackingTouchBlock)(UITouch* touch, UIEvent *even);
#import <UIKit/UIKit.h>

@interface PRHandleControl : UIControl
@property (nonatomic) UIImage *image;
@property (nonatomic) BOOL opened;
@property (nonatomic, strong) TrackingTouchBlock touchBlock;
- (id)initWithImage:(UIImage*)handleImage frame:(CGRect)frame;
- (void)rotateHandleDegrees:(CGFloat)degrees;
@end
