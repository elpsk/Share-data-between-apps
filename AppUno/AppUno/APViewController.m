//
//  APViewController.m
//  AppUno
//
//  Created by Alberto Pasca on 02/04/12.
//  Copyright (c) 2012 albertopasca.it. All rights reserved.
//

#import "APViewController.h"
#import "APClass.h"
#import "APBase64Converter.h"


@implementation APViewController

- (IBAction)OpenApp:(id)sender
{
  if ( ![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"appdue://"]] ) _TxtOut.text = @"NO AppDue Installed!";
  else _TxtOut.text = @"";

  switch ( ((UIButton*)sender).tag ) {
    case 0: [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"appdue://mode=test"]]; break;
    case 1: [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"appdue://mode=dev"]];  break;
    case 2: [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"appdue://mode=prod"]]; break;
    case 3: 
    { 
      APClass *c = [[APClass alloc] init];
      c.aNumber = [_TxtNum.text intValue];
      c.aString = _TxtStr.text;
      
      NSMutableData *data = [NSMutableData data];
      NSKeyedArchiver *encoder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
      [encoder encodeObject:[NSNumber numberWithInt:c.aNumber] forKey:@"aNum"];
      [encoder encodeObject:c.aString forKey:@"aStr"];
      [encoder finishEncoding];
      [encoder release];

      NSString *d = [NSString stringWithFormat:@"appdue://obj=%@", [APBase64Converter base64forData:data]];
      [c release];
      
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:d]]; 
      
      break;
    }
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  _TxtOut.text = @"";
  _TxtNum.delegate = self;
  _TxtStr.delegate = self;
}

- (void)viewDidUnload {
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [textField resignFirstResponder];
  return YES;
}

@end
