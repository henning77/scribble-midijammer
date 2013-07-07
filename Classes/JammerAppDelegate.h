//
//  JammerAppDelegate.h
//  Jammer
//
//  Created by Henning Böger on 16.10.10.
//  Copyright 2010 Skycoders GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JammerViewController;

@interface JammerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    JammerViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet JammerViewController *viewController;

@end

