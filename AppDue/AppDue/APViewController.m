//
//  APViewController.m
//  AppDue
//
//  Created by Alberto Pasca on 02/04/12.
//  Copyright (c) 2012 albertopasca.it. All rights reserved.
//

#import "APViewController.h"

@implementation APViewController

@synthesize UrlLabel, OutputLabel=_OutputLabel;


- (IBAction)OpenApp:(id)sender
{
  if ( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"appuno://"]] )
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"appuno://"]];
  else {
    UrlLabel.text = @"NO APPUNO installed!";
  }
}

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
