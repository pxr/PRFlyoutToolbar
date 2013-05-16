//
//  PRTestVIewControllerViewController.m
//  PRFlyoutToolbar
//
//  Created by Paul Robinson on 2013-05-15.
//  Copyright (c) 2013 Elastic Rat. All rights reserved.
//

#import "PRTestVIewControllerViewController.h"
#import "PRFlyoutToolbar.h"

@interface PRTestVIewControllerViewController ()

@end

@implementation PRTestVIewControllerViewController


- (void)loadView {
  self.view = [[UIView alloc] init];
  self.view.backgroundColor = [UIColor redColor];
  
  CGRect rectangle = CGRectMake(100, 100, 100, 100);
  PRFlyoutToolbar *ft = [[PRFlyoutToolbar alloc] initWithFrame:rectangle];
  [self.view addSubview:ft];
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
