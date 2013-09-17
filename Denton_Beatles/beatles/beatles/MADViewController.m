//
//  MADViewController.m
//  beatles
//
//  Created by Rob Denton on 9/17/13.
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
    _imageControl.selectedSegmentIndex = -1;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateImage{
    if (_imageControl.selectedSegmentIndex==0) {
        _beatlesImage.image=[UIImage imageNamed:@"beatles1.png"];
        _beatlesLabel.text=@"Young Beatles";
    }
    else if (_imageControl.selectedSegmentIndex==1){
        _beatlesImage.image=[UIImage imageNamed:@"beatles2.png"];
        _beatlesLabel.text=@"Not so young Beatles";
    }
}

-(void)updateCaps{
    if (_capitalizedSwitch.on) {
        _beatlesLabel.text=[_beatlesLabel.text uppercaseString];
    }
    else{
        _beatlesLabel.text=[_beatlesLabel.text lowercaseString];
    }
}

- (IBAction)changeImage:(UISegmentedControl *)sender {
    [self updateImage];
    [self updateCaps];
}
- (IBAction)updateFont:(UISwitch *)sender {
    [self updateCaps];
}
- (IBAction)changeFont:(UISlider *)sender {
    //get the value of the font size
    int fontSize = sender.value;
    //change the font size
    _fontSizeLabel.text=[NSString stringWithFormat:@"%d", fontSize];
    //change the font oboject
    UIFont *newFont = [UIFont systemFontOfSize:sender.value];
    //apply new font
    _beatlesLabel.font=newFont;
}
@end
