//
//  MADViewController.m
//  dentonProject1
//
//  Created by Rob Denton on 9/28/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//
//  With help from: http://nscookbook.com/2013/01/ios-programming-recipe-7-using-the-uipickerview/
//  && http://iosmadesimple.blogspot.com/2012/09/uipickerview-tutorial.html

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController


@synthesize picker;         //picker outlet
@synthesize place;          //about label outlet
@synthesize caption;        //caption outlet
@synthesize imageContainer; //image outlet
@synthesize items;          //my first array in objective-c, help from http://iosmadesimple.blogspot.com/2012/09/uipickerview-tutorial.html

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    picker.delegate = self;
    picker.dataSource = self;
    items = [[NSArray alloc] initWithObjects:@"About", @"Rich Clarkson & Assoc.", @"CU Independent", @"The Greeley Tribune", @"Scripps Howard", nil];
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
    return [items count]; //Number of rows in picker: count my array
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60.0; //Space between picker rows
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [items objectAtIndex:row];//Pulls in my array so that each row is one piece of the array
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
//When the picker gets spun this function goes to work
{
    switch(row) //switches content in my outlets depending on the case
    {
        //I did not know about switches and cases before I saw it in the examples I looked at
        //but I did my research on it: http://www.techotopia.com/index.php/The_Objective-C_switch_Statement
        case 0:
            imageContainer.image=[UIImage imageNamed:@"rdent.png"]; //image
            self.place.text = @"About"; //about label
            self.caption.text = @"Rob is a senior journalism student at CU-Boulder and the editor-in-chief at the CU Independent. You can find him on Twitter at @robertrdenton."; //caption
            break; //and I learned that the break is very important after 20 minutes of trying to fix a bug
        case 1:
            imageContainer.image=[UIImage imageNamed:@"rca.png"];
            self.place.text = @"Rich Clarkson & Assoc.";
            self.caption.text = @"Carmelita Jeter, 3, takes second early in the women’s 100-meter dash during the 2011 USA Outdoor Track & Field Championships.";
            break;
        case 2:
            imageContainer.image=[UIImage imageNamed:@"cui.png"];
            self.place.text = @"CU Independent";
            self.caption.text = @"CU senior Jonathan Edwards is arrested on April 20, 2012 for taking part in a protest against the closure of campus.";
            break;
        case 3:
            imageContainer.image=[UIImage imageNamed:@"gt.png"];
            self.place.text = @"The Greeley Tribune";
            self.caption.text = @"Ron Borth of Ault, Colo. takes turn four during the championship race of the lawn mower competition at the Greeley Stampede.";
            break;
        case 4:
            imageContainer.image=[UIImage imageNamed:@"shwf.png"];
            self.place.text = @"Scripps Howard";
            self.caption.text = @"Protesters with water guns march toward the Washington Monument July 3 in support of the Second Amendment and Toys for Tots.";
            break;
            
    }
}
@end
