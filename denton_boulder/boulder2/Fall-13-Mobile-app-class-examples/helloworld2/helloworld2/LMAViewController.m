//
//  LMAViewController.m
//  helloworld2
//
//  Created by Aileen Pierce on 9/1/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import "LMAViewController.h"

@interface LMAViewController ()

@end

@implementation LMAViewController

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
    NSString *title = [sender titleForState:UIControlStateNormal];
    _messageText.text = [NSString stringWithFormat:@"%@ World", title];
}
@end
