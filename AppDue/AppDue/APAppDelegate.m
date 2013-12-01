//
//  APAppDelegate.m
//  AppDue
//
//  Created by Alberto Pasca on 02/04/12.
//  Copyright (c) 2012 albertopasca.it. All rights reserved.
//

#import "APAppDelegate.h"
#import "APViewController.h"
#import "APBase64Converter.h"


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
  if (!url) { return NO; }

  NSString *str = [NSString stringWithFormat:@"%@", url];
  
  NSArray *arr = [str componentsSeparatedByString:@"="];
  
  if ( [[arr objectAtIndex:1] isEqualToString:@"test"] || 
       [[arr objectAtIndex:1] isEqualToString:@"dev"]  || 
       [[arr objectAtIndex:1] isEqualToString:@"prod"] ) {

    NSString *URLString = [url absoluteString];
    [[NSUserDefaults standardUserDefaults] setObject:URLString forKey:@"url"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    self.viewController.UrlLabel.text = [NSString stringWithFormat:@"Url Mode: %@", [arr objectAtIndex:1]];
    self.viewController.OutputLabel.text = @"";
  } 
  else 
  {
    self.viewController.UrlLabel.text = @"Url Mode: CLASS OBJ";

    NSData *data = [APBase64Converter base64DataFromString:[arr objectAtIndex:1]];
    
    NSKeyedUnarchiver *decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    int number       = [[decoder decodeObjectForKey:@"aNum"] intValue];
    NSString *string = [decoder  decodeObjectForKey:@"aStr"];
    [decoder finishDecoding];
    [decoder release];
    
    self.viewController.OutputLabel.text = [NSString stringWithFormat:@"Num: %d - Str: %@", number, string];
  }

  return YES;
}

@end


