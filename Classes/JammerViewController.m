//
//  JammerViewController.m
//  Jammer
//
//  Created by Henning Böger on 16.10.10.
//  Copyright 2010 Skycoders GmbH. All rights reserved.
//

#import "JammerViewController.h"
#import "libdsmi_iphone.h"

@implementation JammerViewController

#pragma mark -
#pragma mark Actions

- (IBAction)sliderPitchChanged:(id)sender
{
	UISlider *slider = (UISlider*)sender;
	LOG(@"sliderPitchChanged: %f", slider.value);
	unsigned int pitch = (int)(slider.value * (1<<15 - 1));
	unsigned char pitch1 = pitch & 127;
	unsigned char pitch2 = pitch >> 7;
	[libdsmi writeMIDIMessage:MIDI_PC MIDIChannel:1 withData1:pitch1 withData2:pitch2];
}
- (IBAction)sliderChanged:(id)sender
{
	UISlider *slider = (UISlider*)sender;
	LOG(@"sliderChanged: %f", slider.value);
	
	unsigned char value = (int)(slider.value * 127);
	[libdsmi writeMIDIMessage:MIDI_CC MIDIChannel:1 withData1:slider.tag withData2:value];
}

- (IBAction)buttonDown:(id)sender
{
	UIButton *button = (UIButton*)sender;
	LOG(@"buttonDown");
	
	// Save current bg color.
	[button setTitleColor:button.backgroundColor forState:UIControlStateHighlighted];
	
	button.backgroundColor = [UIColor blackColor];
	
	[libdsmi writeMIDIMessage:NOTE_ON MIDIChannel:1 withData1:button.tag withData2:110];
}
- (IBAction)buttonUp:(id)sender
{
	UIButton *button = (UIButton*)sender;
	LOG(@"buttonUp");
	
	// Restore bg color.
	button.backgroundColor = button.currentTitleColor;
	
	[libdsmi writeMIDIMessage:NOTE_OFF MIDIChannel:1 withData1:button.tag withData2:90];
}

#pragma mark -
#pragma mark UIViewController

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	libdsmi = [[libdsmi_iphone alloc] init];
}


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
