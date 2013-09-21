//
//  MADViewController.m
//  tipCalc
//
//  Created by Rob Denton on 9/19/13.
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
    _checkAmount.delegate=self;
    _tipPercent.delegate=self;
    _people.delegate=self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)updateTipTotals
{
    //get the values from the text fields
    //floatValue returns a float, intValue returns an int
    float amount=[_checkAmount.text floatValue];
    float pct=[_tipPercent.text floatValue];
    int numberOfPeople=[_people.text intValue];
    
    //Convert pct to decimal
    pct=pct/100;
    
    //compute the totals
    float tip=amount*pct;
    float total=amount+tip;
    float personTotal=0;
    
    //handles divide by zero
    if (numberOfPeople>0){
        personTotal=total/numberOfPeople;
    }
    else{
        UIAlertView *alertView=[[UIAlertView alloc]
                                initWithTitle:@"Warning!"
                                message:@"The number of people must be greater than zero"
                                delegate:self
                                cancelButtonTitle:@"Cancel"
                                otherButtonTitles:@"Ok", nil];
        [alertView show];
    }
    
    //use NSNumberFormatter to set the format style to currency
    NSNumberFormatter *currencyFormatter=[[NSNumberFormatter alloc]init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    //update labels, stringFromNumber: generates strings
    _tipDue.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:tip]];
    _totalDue.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:total]];
    _totalDuePerPerson.text=[currencyFormatter stringFromNumber:[NSNumber numberWithFloat:personTotal]];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==1)//OK button
    {
        _people.text=[NSString stringWithFormat:@"1"];
        [self updateTipTotals];
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    [self updateTipTotals];
}

@end
