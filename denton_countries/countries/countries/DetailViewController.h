//
//  DetailViewController.h
//  countries
//
//  Created by Rob Denton on 10/24/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic)NSMutableArray *countryList;

@end
