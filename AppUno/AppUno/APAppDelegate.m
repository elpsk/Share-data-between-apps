//
//  APAppDelegate.m
//  AppUno
//
//  Created by Alberto Pasca on 02/04/12.
//  Copyright (c) 2012 albertopasca.it. All rights reserved.
//

#import "APAppDelegate.h"
#import "APViewController.h"


@implementation APAppDelegate

@synthesize window = _window, viewController = _viewController;


- (void)dealloc
{
  [_window release];
  [_viewController release];
  [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
  self.viewController = [[[APViewController alloc] initWithNibName:@"APViewController" bundle:nil] autorelease];
  self.window.rootViewController = self.viewController;
  [self.window makeKeyAndVisible];
  return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
  if (!url) {  return NO; }
  
  NSString *URLString = [url absoluteString];
  [[NSUserDefaults standardUserDefaults] setObject:URLString forKey:@"url"];
  [[NSUserDefaults standardUserDefaults] synchronize];
  return YES;
}

@end
