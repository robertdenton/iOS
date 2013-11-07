//
//  MADThirdViewController.m
//  project2
//
//  Created by Rob Denton on 11/7/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADThirdViewController.h"

@interface MADThirdViewController ()

@end

@implementation MADThirdViewController

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
    _webView.delegate=self;
    [self loadWebPageWithString:@"http://redwood.colorado.edu/rode3486/dm2"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadWebPageWithString:(NSString *)urlString{
    NSURL *address=[NSURL URLWithString:urlString];
    NSURLRequest *request=[NSURLRequest requestWithURL:address];
    [_webView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_spin startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_spin stopAnimating];
}

@end
