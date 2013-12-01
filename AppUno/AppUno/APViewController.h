//
//  APViewController.h
//  AppUno
//
//  Created by Alberto Pasca on 02/04/12.
//  Copyright (c) 2012 albertopasca.it. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APViewController : UIViewController <UITextFieldDelegate> {

  IBOutlet UITextField *_TxtNum;
  IBOutlet UITextField *_TxtStr;
  IBOutlet UILabel     *_TxtOut;
  
}

- (IBAction) OpenApp:(id)sender;

@end
