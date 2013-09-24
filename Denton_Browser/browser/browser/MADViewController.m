//
//  MADViewController.m
//  browser
//
//  Created by Rob Denton on 9/24/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _webView.delegate=self; // sets the controller as the delegate of the UIWebView Instance
    [self loadWebPageWithString:@"http://www.google.com"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// load a new web page in the web view
-(void)loadWebPageWithString:(NSString *)urlString
//  The NSString passed should be a properly formed URL
{
    NSURL *url = [NSURL URLWithString:urlString]; // a NSURL object is initialized using an NSString that is passed to the method
    NSURLRequest *request = [NSURLRequest requestWithURL:url]; // Constructs an NSURLRequest object from an NSURL object
    [_webView loadRequest:request]; // loads an NSURLRequest object
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"All the inter tubes must be backed up. Could not load Web page."
                                            message:[error localizedDescription] //NSError translates error messages into the user's language
                                            delegate:self
                                            cancelButtonTitle:nil
                                            otherButtonTitles:@"OK", nil];
    [alertView show]; //Send the message to display the alertView
}

- (IBAction)bookmarkItemTapped:(UIBarButtonItem *)sender {
    //Creates action sheet
    UIActionSheet *actionSheet=[[UIActionSheet alloc] initWithTitle:nil
                                            delegate:self
                                            cancelButtonTitle:@"Cancel"
                                            destructiveButtonTitle:nil
                                            otherButtonTitles:@"Home - Google", @"Reddit", @"TweetDeck", @"Facebook", nil];
    [actionSheet showFromToolbar:_toolbar];
    //displays the action sheet
}

//UIActionSheetDelegate Method; called wehn a selection is made on an action sheet
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0){
        [self loadWebPageWithString:@"http://www.google.com"];
    }
    else if (buttonIndex==1){
        [self loadWebPageWithString:@"http://www.reddit.com"];
    }
    else if (buttonIndex==2){
        [self loadWebPageWithString:@"http://www.tweetdeck.com"];
    }
    else if (buttonIndex==3){
        [self loadWebPageWithString:@"http://www.facebook.com"];
    }
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [_spinner startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_spinner stopAnimating];
}

@end