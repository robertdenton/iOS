//
//  MADThirdViewController.h
//  project2
//
//  Created by Rob Denton on 11/7/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//
//  Logo from theNounProject.com

#import <UIKit/UIKit.h>

@interface MADThirdViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spin;

@end
