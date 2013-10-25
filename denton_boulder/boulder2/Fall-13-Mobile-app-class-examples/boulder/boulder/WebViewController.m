//
//  WebViewController.m
//  boulder
//
//  Created by Aileen Pierce on 10/13/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

//load a new web page in the web view
-(void)loadWebPageWithString:(NSString *)urlString {
    //The NSString passed should be a properly formed URL
    NSURL *url = [NSURL URLWithString:urlString]; //a NSURL object is initialized using a NSString that is passed to the method
    NSURLRequest *request = [NSURLRequest requestWithURL:url]; //constructs a NSURLRequest object from a NSURL object
    [_boulderWebView loadRequest:request]; //loads a NSURLRequest object
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _boulderWebView.delegate=self;
    [self loadWebPageWithString:@"http://www.bouldercolorado.gov/"];
	// Do any additional setup after loading the view.
}

//UIWebViewDelegate method that is called when a web page begins to load
-(void)webViewDidStartLoad:(UIWebView *)webView{
	[_boulderSpinner startAnimating]; //sends the startAnimating message to the spinner
}
    
//UIWebViewDelegate method that is called when a web page loads successfully
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_boulderSpinner stopAnimating]; //sends the stopAnimating message to the spinner
}
        
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
