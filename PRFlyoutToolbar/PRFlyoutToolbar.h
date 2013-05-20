//
//  PRFlyoutToolbar.h
//  PRFlyoutToolbar
//
//  Created by Paul Robinson on 2013-05-15.
//  Copyright (c) 2013 Elastic Rat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PRFlyoutToolbar : UIControl

@property(nonatomic,copy) NSArray *items;
@property(nonatomic) BOOL open;

- (void)setItems:(NSArray *)items animated:(BOOL)animated;
@end
