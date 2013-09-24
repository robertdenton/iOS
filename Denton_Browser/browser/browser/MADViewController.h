//
//  MADViewController.h
//  browser
//
//  Created by Rob Denton on 9/24/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController<UIWebViewDelegate, UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
- (IBAction)bookmarkItemTapped:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
