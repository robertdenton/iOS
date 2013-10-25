//
//  MADViewController.m
//  sportImage
//
//  Created by Aileen Pierce on 9/5/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
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
    if(sender.tag==1)
    {
        _SportImage.image=[UIImage imageNamed:@"rockies_logo.png"];
        NSString *message = [[NSString alloc] initWithFormat:@"%@ I'm a Rockies fan too", _nameField.text];
        _messageLabel.text=message;
    }
    if(sender.tag==2)
    {
        _SportImage.image=[UIImage imageNamed:@"broncos_logo.png"];
        NSString *message = [[NSString alloc] initWithFormat:@"The Broncos are ok %@", _nameField.text];
        _messageLabel.text=message;
    }
}
- (IBAction)textFieldDoneEditing:(UITextField *)sender {
    [sender resignFirstResponder];
}

@end
