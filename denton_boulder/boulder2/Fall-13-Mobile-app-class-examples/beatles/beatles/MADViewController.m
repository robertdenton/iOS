//
//  MADViewController.m
//  beatles
//
//  Created by Aileen Pierce on 9/11/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    //value -1 will ensure that neither segment is selected initially
    _imageControl.selectedSegmentIndex = -1;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateImage{
    if (_imageControl.selectedSegmentIndex==0) {
        _titleLabel.text=@"Young Beatles";
		_beatlesImage.image=[UIImage imageNamed:@"beatles1.png"];
    } else if (_imageControl.selectedSegmentIndex==1) {
        _titleLabel.text=@"Not as young Beatles";
		_beatlesImage.image=[UIImage imageNamed:@"beatles2.png"];
    }
}

-(void)updateCaps{
    if (_capitalizedSwitch.on) {
		_titleLabel.text=[_titleLabel.text uppercaseString];
	} else {
		_titleLabel.text=[_titleLabel.text lowercaseString];
	}
}

- (IBAction)changeImage:(UISegmentedControl *)sender {
    [self updateImage];
    [self updateCaps];
}

- (IBAction)updateFont:(UISwitch *)sender {
    [self updateCaps];
}

- (IBAction)changeFontSize:(UISlider *)sender {
    //get the font size
	int fontSize = sender.value;
	// change the font size label
	_fontSizeNumberLabel.text=[NSString stringWithFormat:@"%d", fontSize];
	// create a new font object
	UIFont *newFont = [UIFont systemFontOfSize:sender.value];
	//apply the new font to the label
	_titleLabel.font=newFont;
}
@end
