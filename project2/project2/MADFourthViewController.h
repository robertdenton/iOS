//
//  MADFourthViewController.h
//  project2
//
//  Created by Rob Denton on 11/7/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//
//  With help from this tutorial on using the MessageUI framework and MFMailCompose
//  http://www.iphonedevsdk.com/forum/tutorial-discussion/43633-quick-tutorial-on-how-to-add-mfmailcomposeviewcontroller.html
//  Which has a lot of depricated things I see now
//  So I used...
//  http://www.appcoda.com/ios-programming-101-send-email-iphone-app/
//  And the Apple documentation
//  https://developer.apple.com/library/ios/documentation/MessageUI/Reference/MessageUI_Framework_Reference/_index.html
//
//  https://developer.apple.com/library/ios/documentation/MessageUI/Reference/MFMailComposeViewController_class/Reference/Reference.html
//
//  Logo from theNounProject.com

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface MADFourthViewController : UIViewController <MFMailComposeViewControllerDelegate>

- (IBAction)sendMail:(id)sender;

@end
