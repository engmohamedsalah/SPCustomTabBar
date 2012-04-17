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

#import "SPCustomTabBar.h"

@interface SPCustomTabBar()

@property (nonatomic, retain) NSMutableArray *buttonsArray;
@property (nonatomic, assign) float barHeight;
@property (nonatomic, assign) int tabNumber;
@property (nonatomic, retain) NSMutableArray *imagesArray;

- (void) hideSystemTabBar;
- (void) addButtonsToTabBar;
- (void) tabTapped:(id)sender;

@end

@implementation SPCustomTabBar

@synthesize buttonsArray;
@synthesize barHeight;
@synthesize tabNumber;
@synthesize imagesArray;

- (id)initWithBarHeight:(float)aBarHeight tabNumber:(int)aTabNumber images:(NSMutableArray*)anImagesArray 
{
    self = [super init];
    if (self) {
        barHeight = aBarHeight;
        tabNumber = aTabNumber;
        imagesArray = [anImagesArray retain];
        buttonsArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    
	[super viewWillAppear:animated];
	[self hideSystemTabBar];
	[self addButtonsToTabBar];
    [self showCustomTabBar];
}

- (void)hideSystemTabBar
{
    //Hide system tab frame
	for(UIView *view in self.view.subviews)
	{
		[view setBackgroundColor:[UIColor clearColor]];
		if([view isKindOfClass:[UITabBar class]])
		{
			view.hidden = YES;
			break;
		}
	}


}

- (void)hideCustomTabBar 
{
    // Set the content correct size
    if (![self.view.subviews count] < 2 )
	{
        
		UIView *contentView;
        
		if ( [[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
            contentView = [self.view.subviews objectAtIndex:1];
		else
            contentView = [self.view.subviews objectAtIndex:0];
        
		contentView.frame = CGRectMake(self.view.bounds.origin.x,
                                       self.view.bounds.origin.y,
                                       self.view.bounds.size.width,
                                       self.view.bounds.size.height);
	}
    
	for (UIButton* button in buttonsArray)
	{
		[button setHidden:YES];
	}
    
   
}

- (void)showCustomTabBar 
{
	for (UIButton* button in buttonsArray)
	{
		[button setHidden:NO];
	}
    
    // Set the content correct size
    if (![self.view.subviews count] < 2 )
	{
        
		UIView *contentView;
        
		if ( [[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
            contentView = [self.view.subviews objectAtIndex:1];
		else
            contentView = [self.view.subviews objectAtIndex:0];
        
		contentView.frame = CGRectMake(self.view.bounds.origin.x,
                                       self.view.bounds.origin.y,
                                       self.view.bounds.size.width,
                                       self.view.bounds.size.height - barHeight);
	}
}

-(void)addButtonsToTabBar
{
	for (int i = 0; i < tabNumber; ++i)
	{
        //Get the button image name from the Array
		UIImage *btnImage = [UIImage imageNamed:[imagesArray objectAtIndex:i*2]];
		UIImage *btnImageSelected = [UIImage imageNamed:[imagesArray objectAtIndex:i*2+1]];

        //Set button type
		UIButton* thisButton = [UIButton buttonWithType:UIButtonTypeCustom]; 
        // Set the size and position of the button (dinamically)
		[thisButton setFrame:CGRectMake((self.view.bounds.size.width/tabNumber*i), self.view.bounds.size.height-barHeight, self.view.bounds.size.width/tabNumber, barHeight)]; 
        // Set not selected button image
		[thisButton setBackgroundImage:btnImage forState:UIControlStateNormal]; 
        // Set selected button image
		[thisButton setBackgroundImage:btnImageSelected forState:UIControlStateSelected];
        // Button tag used for remap selected tab item
		[thisButton setTag:i];
        //Set no Shadow on button pressed
		[thisButton setAdjustsImageWhenHighlighted:NO];
		// Set first tab as selected
        if (i == 0)
		{
			[thisButton setSelected:true];
		}
        
		[self.view addSubview:thisButton];
		[thisButton addTarget:self action:@selector(tabTapped:) forControlEvents:UIControlEventTouchUpInside];
        [buttonsArray addObject:thisButton];
	}
	
}

- (void)tabTapped:(id)sender
{
	int tagNum = [sender tag];
    
    //Set the tapped tab as selected, others not
    for (UIButton* thisButton in buttonsArray)
	{ 
		[thisButton setSelected:thisButton.tag == tagNum];
	}
	
    //Pass the choosen tab to superclass
	self.selectedIndex = tagNum;
}


- (void)dealloc {
    
    [buttonsArray release];
    [imagesArray release];
	[super dealloc];
}

@end
