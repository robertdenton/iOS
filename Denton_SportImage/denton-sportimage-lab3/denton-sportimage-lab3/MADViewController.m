//
//  MADViewController.m
//  denton-sportimage-lab3
//
//  Created by Rob Denton on 9/10/13.
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

- (IBAction)rockies:(UIButton *)sender {

    if(sender.tag==1){
        _image.image=[UIImage imageNamed:@"rockies_logo.png"];
        NSString *messageName = [[NSString alloc] initWithFormat:@"%@, I want another Rocktober!", _name.text];
        _message.text=messageName;
    }
    if(sender.tag==2){
        _image.image=[UIImage imageNamed:@"broncos_logo.png"];
        NSString *messageName = [[NSString alloc] initWithFormat:@"Peyton all day, %@?", _name.text];
        _message.text=messageName;
    }

}
- (IBAction)byeByeTextField:(UITextField *)sender {
    [sender resignFirstResponder];
}
@end
