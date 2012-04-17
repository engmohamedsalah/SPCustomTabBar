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
//  -----------------------------------------------------------------------------
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
//  -----------------------------------------------------------------------------
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
