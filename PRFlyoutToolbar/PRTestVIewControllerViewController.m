//
//  PRTestVIewControllerViewController.m
//  PRFlyoutToolbar
//
//  Created by Paul Robinson on 2013-05-15.
//  Copyright (c) 2013 Elastic Rat. All rights reserved.
//

#import "PRTestVIewControllerViewController.h"
#import "PRFlyoutToolbar.h"
#import <QuartzCore/QuartzCore.h>

@interface PRTestVIewControllerViewController ()

@end

@implementation PRTestVIewControllerViewController


- (void)loadView {
  self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
  self.view.backgroundColor = [UIColor grayColor];

  UIBarButtonItem *bb1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
  UIBarButtonItem *bb2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
  UIBarButtonItem *bb3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
  
  PRFlyoutToolbar *ft = [[PRFlyoutToolbar alloc] initWithFrame:CGRectMake(20, 400, 0, 0)];
  ft.items = [NSArray arrayWithObjects:bb1, bb2, bb3, nil];
  [self.view addSubview:ft];
}

- (CGRect)toolBarFrame {
  CGRect frame, remain;
  
  CGRectDivide(self.view.frame,
               &frame,
               &remain,
               44,
               CGRectMaxYEdge);
  
  return CGRectOffset(frame, 0, -[self statusBarHeight]);
}

- (float)statusBarHeight {
  return [UIApplication sharedApplication].statusBarFrame.size.height;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}



@end
