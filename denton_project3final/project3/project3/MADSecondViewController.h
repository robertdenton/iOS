//
//  MADSecondViewController.h
//  project3
//
//  Created by Rob Denton on 12/8/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADSecondViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *web;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property(nonatomic) BOOL scalesPageToFit; //allows zoom


@end
