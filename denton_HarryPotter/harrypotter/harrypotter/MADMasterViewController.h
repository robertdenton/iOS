//
//  MADMasterViewController.h
//  harrypotter
//
//  Created by Rob Denton on 10/31/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>

//Could import but says to compiler trust me, this will be here, look for it again so that there is not an error
@class MADDetailViewController;

@interface MADMasterViewController : UITableViewController

@property (strong, nonatomic) MADDetailViewController *detailViewController;
//Copy suggested for nsarray, nsdictionary, ?
@property (copy, nonatomic) NSArray *characters;

@end
