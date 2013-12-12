//
//  MADThirdViewController.m
//  project3
//
//  Created by Rob Denton on 12/8/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//
//  With help from: http://www.appcoda.com/ios-programming-101-integrate-twitter-and-facebook-sharing-in-ios-6/
//  and http://www.appcoda.com/ios-programming-101-send-email-iphone-app/
//


#import "MADThirdViewController.h"


@interface MADThirdViewController ()

@end

@implementation MADThirdViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _web2.delegate=self;
    [self loadWebPageWithString:@"http://robertrdenton.files.wordpress.com/2013/08/resume_denton_08-03-131.pdf"];//load my resume
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)email:(UIButton *)sender {//send email button
    NSArray *toRecipients = [NSArray arrayWithObject:@"robert.denton9@gmail.com"];//send any questions to me
    NSString *subject = @"Hey there";//simple subject line
    
    MFMailComposeViewController *mc=[[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate=self;
    [mc setToRecipients:toRecipients];//setting email
    [mc setSubject:subject];//setting subject
    
    [self presentViewController:mc animated:YES completion:NULL]; //present mail interface
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    switch (result) {
        case MFMailComposeResultCancelled://if cancelled log
            NSLog(@"Cancelled");
            break;
        case MFMailComposeResultSaved://if saved log
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent://if sent log
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed://if failed log error
            NSLog(@"Mail sent failure %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];//close mail interface
}


- (IBAction)facebook:(UIButton *)sender {//post to facebook
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {//check to see if FB is connected
        SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [controller setInitialText:@"Rob Denton is cool. You should hire him."];//set initial text
        [controller addURL:[NSURL URLWithString:@"http://www.robertrdenton.com"]];//add my url
        [controller addImage:[UIImage imageNamed:@"res.png"]];//add my resume
        [self presentViewController:controller animated:YES completion:Nil];//present facebook interface, automatically dismissed thanks to framwork
        NSLog(@"Good");
    }
}

- (IBAction)twitter:(UIButton *)sender {//post to twitter
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]){//check to see if connected to Twitter
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"@RobertRDenton is cool. You should hire him. #please"];//set initial text
        [self presentViewController:tweetSheet animated:YES completion:nil];//present Twitter interface
    }
}

-(void)loadWebPageWithString:(NSString *)urlString{//loads my resume as a webpage so it can be easily inspected (zoomed)
    NSURL *address=[NSURL URLWithString:urlString];
    NSURLRequest *request=[NSURLRequest requestWithURL:address];
    [_web2 loadRequest:request];
    _web2.scalesPageToFit=YES;//allows zoom
}

-(void)webViewDidStartLoad:(UIWebView *)webView{//spinner thingz
    [_spinner2 startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_spinner2 stopAnimating];
    [_spinner2 removeFromSuperview];
    NSLog(@"should be gone");
}

@end
