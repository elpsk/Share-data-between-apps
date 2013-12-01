//
//  APClass.h
//  AppUno
//
//  Created by Alberto Pasca on 02/04/12.
//  Copyright (c) 2012 albertopasca.it. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APClass : NSObject {
  
  int _aNumber;
  NSString *_aString;
  
}

@property (nonatomic, assign) int aNumber;
@property (nonatomic, retain) NSString *aString;

@end
