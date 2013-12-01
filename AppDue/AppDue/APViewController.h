//
//  APViewController.h
//  AppDue
//
//  Created by Alberto Pasca on 02/04/12.
//  Copyright (c) 2012 albertopasca.it. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APAppDelegate.h"

@interface APViewController : UIViewController {
 
  IBOutlet UILabel *UrlLabel;
  IBOutlet UILabel *_OutputLabel;
  
}

@property (nonatomic, retain) UILabel *UrlLabel;
@property (nonatomic, retain) UILabel *OutputLabel;

- (IBAction)OpenApp:(id)sender;

@end
