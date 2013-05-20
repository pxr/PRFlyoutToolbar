//
//  PRAppDelegate.m
//  PRFlyoutToolbar
//
//  Created by Paul Robinson on 2013-05-15.
//  Copyright (c) 2013 Elastic Rat. All rights reserved.
//

#import "PRAppDelegate.h"
#import "PRTestVIewControllerViewController.h"

@implementation PRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [DDLog addLogger:[DDTTYLogger sharedInstance]];
  
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];

  PRTestVIewControllerViewController *tvc = [[PRTestVIewControllerViewController alloc] init];
  self.window.rootViewController = tvc;

  [self.window makeKeyAndVisible];
  return YES;
}

- (void)application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame {
  TRACE
}

@end
