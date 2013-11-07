//
//  MADSecondViewController.m
//  project2
//
//  Created by Rob Denton on 11/7/13.
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
    _picker.delegate = self;
    _picker.dataSource = self;
    _items = [[NSArray alloc] initWithObjects:@"Rich Clarkson & Assoc.", @"CU Independent", @"The Greeley Tribune", @"Scripps Howard", nil];
    /*UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"Please note:"
                                                      message:@"You can view photos at full screen by rotating your device. While viewing in full-screen mode, tap above and below the caption to see other images" //NSError translates error messages into the user's language
                                                     delegate:self
                                            cancelButtonTitle:nil
                                            otherButtonTitles:@"OK", nil];
    [alertView show]; //Send the message to display the alertView*/

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1; //Number of columns in picker: 1
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_items count]; //Number of rows in picker: count my array
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60.0; //Space between picker rows
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_items objectAtIndex:row];//Pulls in my array so that each row is one piece of the array
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
//When the picker gets spun this function goes to work
{
    switch(row) //switches content in my outlets depending on the case
    {
            //I did not know about switches and cases before I saw it in the examples I looked at
            //but I did my research on it: http://www.techotopia.com/index.php/The_Objective-C_switch_Statement
        case 0:
            _imageContainer.image=[UIImage imageNamed:@"rca.png"];
            //self.place.text = @"Rich Clarkson & Assoc.";
            //self.caption.text = @"Carmelita Jeter, 3, takes second early in the women’s 100-meter dash during the 2011 USA Outdoor Track & Field Championships.";
            break;
        case 1:
            _imageContainer.image=[UIImage imageNamed:@"cui.png"];
            //self.place.text = @"CU Independent";
            //self.caption.text = @"CU senior Jonathan Edwards is arrested on April 20, 2012 for taking part in a protest against the closure of campus.";
            break;
        case 2:
            _imageContainer.image=[UIImage imageNamed:@"gt.png"];
            //self.place.text = @"The Greeley Tribune";
            //self.caption.text = @"Ron Borth of Ault, Colo. takes turn four during the championship race of the lawn mower competition at the Greeley Stampede.";
            break;
        case 3:
            _imageContainer.image=[UIImage imageNamed:@"shwf.png"];
            //self.place.text = @"Scripps Howard";
            //self.caption.text = @"Protesters with water guns march toward the Washington Monument July 3 in support of the Second Amendment and Toys for Tots.";
            break;
    }
}


@end
