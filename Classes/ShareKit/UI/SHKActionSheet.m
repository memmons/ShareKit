//
//  SHKActionSheet.m
//  ShareKit
//
//  Created by Nathan Weiner on 6/10/10.

//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//

#import "SHKActionSheet.h"
#import "SHK.h"
#import "SHKSharer.h"
#import "SHKCustomShareMenu.h"
#import <Foundation/NSObjCRuntime.h>

<<<<<<< HEAD
static BOOL hasMoreButton = NO;

=======
>>>>>>> 9139332ef1ab10128697487185c106d81215df6a
@implementation SHKActionSheet

@synthesize item, sharers;

- (void)dealloc
{
	[item release];
	[sharers release];
	[super dealloc];
}

+ (SHKActionSheet *)actionSheetForType:(SHKShareType)type
{
<<<<<<< HEAD
    return [self actionSheetForType:type withSharers:nil];
}

+ (SHKActionSheet *)actionSheetForType:(SHKShareType)type withSharers:(NSArray *)sharers
{
	SHKActionSheet *as = [[SHKActionSheet alloc] initWithTitle:nil
													  delegate:self
											 cancelButtonTitle:nil
										destructiveButtonTitle:nil
											 otherButtonTitles:nil];
=======
	SHKActionSheet *as = [[SHKActionSheet alloc] initWithTitle:SHKLocalizedString(@"Share")
													  delegate:nil
											 cancelButtonTitle:nil
										destructiveButtonTitle:nil
											 otherButtonTitles:nil];
	as.delegate = as;
>>>>>>> 9139332ef1ab10128697487185c106d81215df6a
	as.item = [[[SHKItem alloc] init] autorelease];
	as.item.shareType = type;
	
	as.sharers = [NSMutableArray arrayWithCapacity:0];
<<<<<<< HEAD
	if (!sharers) {
	    sharers = [SHK favoriteSharersForType:type];
	}
		
	// Add buttons for each favorite sharer
	id class;
	for(NSString *sharerId in sharers)
=======
	NSArray *favoriteSharers = [SHK favoriteSharersForType:type];
		
	// Add buttons for each favorite sharer
	id class;
	for(NSString *sharerId in favoriteSharers)
>>>>>>> 9139332ef1ab10128697487185c106d81215df6a
	{
		class = NSClassFromString(sharerId);
		if ([class canShare])
		{
			[as addButtonWithTitle: [class sharerTitle] ];
			[as.sharers addObject:sharerId];
		}
	}
	
<<<<<<< HEAD
    int total_sharers = 0;
    for (NSString *key in [SHK sharersDictionary]) {
        total_sharers += [[[SHK sharersDictionary] objectForKey:key] count];
    }

    if (total_sharers > [sharers count] && !sharers) {
        hasMoreButton = YES;
	    // Add More button
	    [as addButtonWithTitle:SHKLocalizedString(@"More...")];
    }
    else {
        hasMoreButton = NO;
    }
=======
	// Add More button
	[as addButtonWithTitle:SHKLocalizedString(@"More...")];
>>>>>>> 9139332ef1ab10128697487185c106d81215df6a
	
	// Add Cancel button
	[as addButtonWithTitle:SHKLocalizedString(@"Cancel")];
	as.cancelButtonIndex = as.numberOfButtons -1;
	
	return [as autorelease];
}

+ (SHKActionSheet *)actionSheetForItem:(SHKItem *)i
{
	SHKActionSheet *as = [self actionSheetForType:i.shareType];
	as.item = i;
	return as;
}

<<<<<<< HEAD
+ (SHKActionSheet *)actionSheetForItem:(SHKItem *)i withSharers:(NSArray *)sharers 
{
	SHKActionSheet *as = [self actionSheetForType:i.shareType withSharers:sharers];
	as.item = i;
	return as;
}


=======
>>>>>>> 9139332ef1ab10128697487185c106d81215df6a
- (void)dismissWithClickedButtonIndex:(NSInteger)buttonIndex animated:(BOOL)animated
{
	// Sharers
	if (buttonIndex >= 0 && buttonIndex < sharers.count)
	{
		[NSClassFromString([sharers objectAtIndex:buttonIndex]) performSelector:@selector(shareItem:) withObject:item];
	}
	
	// More
<<<<<<< HEAD
	else if (buttonIndex == sharers.count && hasMoreButton)
=======
	else if (buttonIndex == sharers.count)
>>>>>>> 9139332ef1ab10128697487185c106d81215df6a
	{
		SHKShareMenu *shareMenu = [[SHKCustomShareMenu alloc] initWithStyle:UITableViewStyleGrouped];
		shareMenu.item = item;
		[[SHK currentHelper] showViewController:shareMenu];
		[shareMenu release];
	}
	
	[super dismissWithClickedButtonIndex:buttonIndex animated:animated];
}

@end