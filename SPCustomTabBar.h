//
//  SPCustomTabBar.h
//  SPCustomTabBar
//
//  Created by Stefano Piamonti on 16/04/12.
//  Copyright (c) 2012 3logic MK s.r.l. All rights reserved.
//  mobile@3logic.it - www.3logic.it
//  
//  [some ideas are taken from: http://www.rumex.it/2010/07/how-to-customise-the-tab-bar-uitabbar-in-an-iphone-application-part-1-of-2/]
//

#import <UIKit/UIKit.h>

@interface SPCustomTabBar : UITabBarController {
    @private
	NSMutableArray* buttonsArray;
	float barHeight;
	int tabNumber;
	NSMutableArray* imagesArray;
}

/*!
 Custom init: you have to specify:
 @param aBarHeight - a bar height (49 is the height of apple tabbar)
 @param aTabNumber - the number of tabs
 @param anImagesArray - an Array of images, where the structure is:
        index 0: first tab not selected
        index 1: first tab selected
        index 2: second tab not selected
        index 3: second tab selected
        ... and so on!
 */
- (id)initWithBarHeight:(float)aBarHeight tabNumber:(int)aTabNumber images:(NSMutableArray*)anImagesArray;

/*!
Hide the custom TabBar
 */
- (void) hideCustomTabBar;

/*!
 Show the custom TabBar
 */
- (void) showCustomTabBar;





@end
