//
//  MADSecondViewController.m
//  boulder2
//
//  Created by Rob Denton on 10/17/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADSecondViewController.h"

@interface MADSecondViewController ()

@end

@implementation MADSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitQuestion:(id)sender {
    NSString *recipients=@"mailto:robert.denton@colorado.edu?subject=Question from Boulder Lab";
    NSString *body=[NSString stringWithFormat:@"&body=%@ from %@ %@", _questionTextView.text, _nameTextField.text, _emailTextField.text];
    NSString *email=[NSString stringWithFormat:@"%@%@", recipients, body];
    NSLog(email);
    email=[email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]; //returns a proper URL string
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];//opens mail app
    NSLog(@"sent");
    [[UIApplication sharedApplication]sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}
@end
