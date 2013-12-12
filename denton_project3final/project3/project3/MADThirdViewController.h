//
//  MADThirdViewController.h
//  project3
//
//  Created by Rob Denton on 12/8/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h> //import MessageUI framework for email
#import <MessageUI/MFMailComposeViewController.h>//import MessageUI framework for email
#import <Social/Social.h>//import Social framework for Twitter, Facebook integration

@interface MADThirdViewController : UIViewController <MFMailComposeViewControllerDelegate, UIWebViewDelegate>
- (IBAction)email:(UIButton *)sender;
- (IBAction)facebook:(UIButton *)sender;
- (IBAction)twitter:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIWebView *web2; //for resume
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner2;
@property(nonatomic) BOOL scalesPageToFit;//allows zoom

@end
