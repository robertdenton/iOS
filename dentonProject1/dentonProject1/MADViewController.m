//
//  MADViewController.m
//  dentonProject1
//
//  Created by Rob Denton on 9/28/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController


@synthesize picker;
@synthesize place;
@synthesize caption;
@synthesize imageContainer;
@synthesize items;

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
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [items count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60.0;
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [items objectAtIndex:row];
}

//If the user chooses from the pickerview, it calls this function;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //Let's print in the console what the user had chosen;
    NSLog(@"Chosen item: %@", [items objectAtIndex:row]);
    switch(row)
    {
        case 0:
            imageContainer.image=[UIImage imageNamed:@"rdent.png"];
            self.place.text = @"About";
            self.caption.text = @"Rob is a senior journalism student at CU-Boulder. You can find him on Twitter at @robertrdenton.";
            break;
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
