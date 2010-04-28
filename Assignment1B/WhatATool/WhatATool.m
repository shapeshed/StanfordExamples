#import <Foundation/Foundation.h>

// Section 1: Strings as file system paths 
void PrintPathInfo() {

	NSLog(@"Section 1: Strings as file system paths");
	NSLog(@"======================================");
	
	/* --------------------------------
	Starting with that string, find a path method that will 
	expand the tilde in the path to the full path to 
	your home directory. Use that method to make a new string, 
	and log the full path in a format like:
	-------------------------------- */
	
	NSString *path = @"~";
	path = [path stringByExpandingTildeInPath];
	NSLog(@"Home path is %@",path);
	
	/* --------------------------------
	NSString has a method that will return an array of path components. 
	Each element in the returned array is a single component in 
	the original path. Use this method to get an array of path 
	components for the path you just logged. Use fast enumeration to enumerate 
	through each item in the returned array, and log each path component. 
	The result should look something like:
		/ 
		Users 
		pmarcos
	-------------------------------- */
	
	NSArray *pathComponents = [path pathComponents];
	NSLog(@"Now let's spit out the path components...");
	for (NSString *element in pathComponents) {
		NSLog(@"%@", element);
	}
	
	NSLog(@"\n");
}

// Section 2: Finding out a bit about our own process
void PrintProcessInfo() {

	NSLog(@"Section 2: Finding out a bit about our own process");
	NSLog(@"======================================");
	
	/* --------------------------------
	Look up the class NSProcessInfo in the documentation.
	You will find a class method that will return an 
	NSProcessInfo object. (In fact, you should find 
	a very handy code sample there as well). From this object, 
	you can access the name and process identifier (pid) of the process. 
	Log these pieces of information to the console using NSLog in the format:
		Process Name: 'WhatATool' Process ID: '4556'
	-------------------------------- */
	
	NSProcessInfo *processInfo = [NSProcessInfo processInfo];
	NSString *processName = [processInfo processName];
	int processID = [processInfo processIdentifier];
	NSLog(@"Process Name: '%@' Process ID:'%d'", processName, processID);

	NSLog(@"\n");

}

// Section 3: A little bookmark dictionary
void PrintBookmarkInfo() {

	NSLog(@"Section 3: A little bookmark dictionary");
	NSLog(@"======================================");
	
	/* --------------------------------
	In this section, you will build a small URL bookmark repository 
	using a mutable dictionary. Each key is an NSString that 
	serves as the description of the URL, the value is an NSURL.
	
	Create a mutable dictionary that contains the following key/value pairs:
	
	Key (NSString)			Value (NSURL)
	Stanford University		http://www.stanford.edu
	Apple						http://www.apple.com 
	CS193P						http://cs193p.stanford.edu
	Stanford on iTunes U		http://itunes.stanford.edu
	Stanford Mall				http://stanfordshop.com
	Enumerate through the keys of the dictionary. While enumerating 
	through the keys, check each key to see if it starts with @”Stanford”. 
	If it does, retrieve the NSURL object for that key from the dictionary, 
	and log both the key string and the NSURL object in 
	the following format below. If the key does not start 
	with @”Stanford”, no output should be printed.
		
		Key: 'Stanford University' URL: 'http://www.stanford.edu'
	-------------------------------- */
	
	NSMutableDictionary *bookmarks = [NSMutableDictionary dictionary];
	[bookmarks setObject: [NSURL URLWithString:@"http://www.stanford.edu"] forKey: @"Stanford University"]; 
	[bookmarks setObject: [NSURL URLWithString:@"http://www.apple.com"] forKey:  @"Apple"]; 
	[bookmarks setObject: [NSURL URLWithString:@"http://cs193p.stanford.edu"] forKey:@"CS193P"] ; 
	[bookmarks setObject: [NSURL URLWithString:@"http://itunes.stanford.edu"] forKey: @"Stanford on iTunes U"]; 
	[bookmarks setObject: [NSURL URLWithString:@"http://stanfordshop.com"] forKey:@"Stanford Mall"] ; 

	for (NSString *key in bookmarks){
		if ([key hasPrefix:@"Stanford"]) {
			NSLog(@"Key: '%@' URL: '%@'", key, [bookmarks valueForKey:key]);
		}
		
	}
	
	NSLog(@"\n");

}

// Section 4: Selectors, Classes and Introspection

void PrintIntrospectionInfo() {
	
	NSLog(@"Section 4: Selectors, Classes and Introspection");
	NSLog(@"======================================");
	
	/* 
	Objective-C has a number of facilities that add to its dynamic 
	object-oriented capabilities.	Many of these facilities deal 
	with determining and using an object's capabilities at runtime.
	
	Create a mutable array and add objects of various types to it. 
	Create instance of the classes we’ve used elsewhere in this 
	assignment to populate the array: NSString, NSURL, NSProcessInfo, NSDictionary, etc. 
	Create some NSMutableString instances and put them in the array as well. 
	Feel free to create other kinds of objects also.
	
		1.Print the class name of the object. 
		2.Log if the object is member of class NSString. 
		3.Log if the object is kind of class NSString. 
		4.Log if the object responds to the selector "lowercaseString".
		5.If the object does respond to the lowercaseString selector, 
		log the result of asking the object to perform that selector (using performSelector:)

	For example, if an array contained an NSString, an NSURL and an NSDictionary the output might look something like this:
		2008-01-10 20:56:03 WhatATool[360] Class name: NSCFString 
		2008-01-10 20:56:03 WhatATool[360] Is Member of NSString: NO 
		2008-01-10 20:56:03 WhatATool[360] Is Kind of NSString: YES 
		2008-01-10 20:56:03 WhatATool[360] Responds to lowercaseString: YES 
		2008-01-10 20:56:03 WhatATool[360] lowercaseString is: hello world! 
		2008-01-10 20:56:03 WhatATool[360] ====================================== 
		2008-01-10 20:56:03 WhatATool[360] Class name: NSURL
		2008-01-10 20:56:03 WhatATool[360] Is Member of NSString: NO 
		2008-01-10 20:56:03 WhatATool[360] Is Kind of NSString: NO 
		2008-01-10 20:56:03 WhatATool[360] Responds to lowercaseString: NO 
		2008-01-10 20:56:03 WhatATool[360] ====================================== 
		2008-01-10 20:56:03 WhatATool[360] Class name: NSCFDictionary
		2008-01-10 20:56:03 WhatATool[360] Is Member of NSString: NO 
		2008-01-10 20:56:03 WhatATool[360] Is Kind of NSString: NO 
		2008-01-10 20:56:03 WhatATool[360] Responds to lowercaseString: NO 
		2008-01-10 20:56:03 WhatATool[360] ======================================
	 */
	
	NSMutableArray *introspect = [NSMutableArray arrayWithCapacity:7];
	
	[introspect addObject:@"Foo bar"];
	[introspect addObject:[NSMutableString stringWithString:@"A mutable string foo"]];
	[introspect addObject:[NSURL URLWithString:@"http://shapeshed.com"]];
	[introspect addObject:[NSDictionary dictionaryWithObjectsAndKeys: 
					   [NSURL URLWithString:@"http://shapeshed.com"], @"Shape Shed",
					   [NSURL URLWithString:@"http://pebbleit.com"], @"Pebble IT",
					   nil]];
	[introspect addObject:[[NSProcessInfo processInfo] processName]];
	[introspect addObject:[NSProcessInfo processInfo]];
	
	for (NSObject *obj in introspect) {
        NSLog(@"Class name: %@", [obj className]);
        NSLog(@"Is Member of NSString? %@", [obj isMemberOfClass:[NSString class]] ? @"YES" : @"NO");
        NSLog(@"Is Kind of NSString? %@", [obj isKindOfClass:[NSString class]] ? @"YES" : @"NO");
		
        BOOL respondsToLowercase = [obj respondsToSelector:@selector(lowercaseString)];
        NSLog(@"Responds to lowercaseString? %@", respondsToLowercase ? @"YES" : @"NO");
        if (respondsToLowercase) {
            NSLog(@"Lowercase version is: '%@'", [obj performSelector:@selector(lowercaseString)]);
        }
        NSLog(@"\n");
    }
	
}

int main (int argc, const char * argv[]) {
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	PrintPathInfo();
	PrintProcessInfo();	
	PrintBookmarkInfo();
	PrintIntrospectionInfo();

	[pool release];
	return 0;
}
