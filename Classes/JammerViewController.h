//
//  JammerViewController.h
//  Jammer
//
//  Created by Henning Böger on 16.10.10.
//  Copyright 2010 Skycoders GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class libdsmi_iphone;

@interface JammerViewController : UIViewController {

	libdsmi_iphone *libdsmi;
}

- (IBAction)sliderPitchChanged:(id)sender;
- (IBAction)sliderChanged:(id)sender;

- (IBAction)buttonDown:(id)sender;
- (IBAction)buttonUp:(id)sender;

@end

