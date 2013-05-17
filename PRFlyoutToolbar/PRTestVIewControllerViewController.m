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
  self.view.backgroundColor = [UIColor redColor];
  
  
  CGRect rectangle = CGRectMake(100, 100, 100, 100);
  PRFlyoutToolbar *ft = [[PRFlyoutToolbar alloc] initWithFrame:rectangle];
  [self.view addSubview:ft];
  
  CGRect frame, remain;
  
  CGRectDivide(self.view.frame,
              &frame,
              &remain,
              44,
              CGRectMaxYEdge);
  
  self.toolBar = [[UIToolbar alloc] initWithFrame:[self toolBarFrame]];
  UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
  self.toolBar.items = [NSArray arrayWithObject:bbi];
  
  [self.view addSubview:self.toolBar];
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

- (void)didChangeStatusBarFrame {
  [UIView beginAnimations:@"frame" context:nil];
  self.toolBar.frame =[self toolBarFrame];
  [UIView commitAnimations];
}

@end
