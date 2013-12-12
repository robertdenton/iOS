//
//  MADDetailViewController.m
//  project3
//
//  Created by Rob Denton on 12/10/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//
//  With lots of help from http://www.appcoda.com/ios-programming-rss-reader-tutorial/
//

#import "MADDetailViewController.h"

@interface MADDetailViewController ()

@end

@implementation MADDetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *myURL = [NSURL URLWithString: [self.url stringByAddingPercentEscapesUsingEncoding:
                                          NSUTF8StringEncoding]];//on load, set the url to a local variable
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [self.webView loadRequest:request];//load the requested URL
    _webView.delegate=self;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"Start");
    //I chose not to start animating on load because the web pages I'm using load as you scroll. (see console) I thought the spinner flashing every time you scrolled would not provide a friendly UX
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"DONE!");
    [_spinner3 stopAnimating];
}

@end
