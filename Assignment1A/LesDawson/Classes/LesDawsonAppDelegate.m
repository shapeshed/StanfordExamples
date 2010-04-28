//
//  LesDawsonAppDelegate.m
//  LesDawson
//
//  Created by George Ornbo on 26/04/2010.
//  Copyright Shape Shed 2010. All rights reserved.
//

#import "LesDawsonAppDelegate.h"

@implementation LesDawsonAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
