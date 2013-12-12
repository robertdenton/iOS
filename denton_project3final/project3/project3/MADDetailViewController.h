//
//  MADDetailViewController.h
//  project3
//
//  Created by Rob Denton on 12/10/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//
//  With lots of help from http://www.appcoda.com/ios-programming-rss-reader-tutorial/
//  

#import <UIKit/UIKit.h>

@interface MADDetailViewController : UIViewController <UIWebViewDelegate>

@property (copy, nonatomic) NSString *url;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner3;

@end