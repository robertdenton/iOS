//
//  ContinentInfoViewController.h
//  countries
//
//  Created by Rob Denton on 10/29/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContinentInfoViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *continentName;
@property (weak, nonatomic) IBOutlet UILabel *countryNumber;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *number;

@end
