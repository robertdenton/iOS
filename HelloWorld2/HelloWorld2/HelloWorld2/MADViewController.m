//
//  MADViewController.m
//  HelloWorld2
//
//  Created by Rob Denton on 9/3/13.
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSString *whatevs=[sender titleForState:UIControlStateNormal];
    _messageText.text=[NSString stringWithFormat:@"%@ World", whatevs];
}
@end
