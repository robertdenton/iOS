//
//  WebViewController.m
//  boulder2
//
//  Created by Rob Denton on 10/24/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [super viewDidLoad];
    _boulderWebView.delegate=self;
    [self loadWebPageWithString:@"http://www.bouldercolorado.gov/"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//load a new web page in the web view
-(void)loadWebPageWithString:(NSString *)urlString {
    //The NSString passed should be a properly formed URL
    NSURL *url = [NSURL URLWithString:urlString]; //a NSURL object is initialized using a NSString that is passed to the method
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //constructs a NSURLRequest object from a NSURL object
    [_boulderWebView loadRequest:request]; //loads a NSURLRequest object 
}

//UIWebViewDelegate method that is called when a web page begins to load
-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_boulderSpinner startAnimating]; //sends the startAnimating message to the spinner
}

//UIWebViewDelegate method that is called when a web page loads successfully
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_boulderSpinner stopAnimating]; //sends the stopAnimating message to the spinner
}

@end
