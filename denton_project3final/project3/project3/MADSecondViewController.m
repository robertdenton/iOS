//
//  MADSecondViewController.m
//  project3
//
//  Created by Rob Denton on 12/8/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADSecondViewController.h"

@interface MADSecondViewController ()

@end

@implementation MADSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _web.delegate=self;
    [self loadWebPageWithString:@"http://redwood.colorado.edu/rode3486/dm2"]; //Loads my DM2 portal
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadWebPageWithString:(NSString *)urlString{
    NSURL *address=[NSURL URLWithString:urlString];
    NSURLRequest *request=[NSURLRequest requestWithURL:address];
    [_web loadRequest:request];
    _web.scalesPageToFit=YES;//allows zoom
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_spinner startAnimating];//any time it loads a new page, animate the spinner
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_spinner stopAnimating];//any time it finishes loading, stop the spinner
    [_spinner removeFromSuperview];//With this don't need check box to make it disappear, courtesy stack overflow when I forgot about the check boxes
}



@end
