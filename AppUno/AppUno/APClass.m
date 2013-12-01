//
//  APClass.m
//  AppUno
//
//  Created by Alberto Pasca on 02/04/12.
//  Copyright (c) 2012 albertopasca.it. All rights reserved.
//

#import "APClass.h"

@implementation APClass
@synthesize aNumber=_aNumber, aString=_aString;


- (void) dealloc {
  [_aString release];
  
  [super dealloc];
}

@end
