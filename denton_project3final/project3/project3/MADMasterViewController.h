//
//  MADMasterViewController.h
//  project3
//
//  Created by Rob Denton on 12/10/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//
//  With lots of help from http://www.appcoda.com/ios-programming-rss-reader-tutorial/
//

#import <UIKit/UIKit.h>

@interface MADMasterViewController : UITableViewController <NSXMLParserDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView; //master table view that will parse XML (RSS)

@end
