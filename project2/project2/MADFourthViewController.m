//
//  MADFourthViewController.m
//  project2
//
//  Created by Rob Denton on 11/7/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADFourthViewController.h"

@interface MADFourthViewController ()

@end

@implementation MADFourthViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMail:(id)sender {
    NSArray *toRecipients = [NSArray arrayWithObject:@"robert.denton9@gmail.com"];
    NSString *subject = @"Hello!";
    
    MFMailComposeViewController *mc=[[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate=self;
    [mc setToRecipients:toRecipients];
    [mc setSubject:subject];
    
    [self presentViewController:mc animated:YES completion:NULL];
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failur %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];//Close mail interface
}



@end
