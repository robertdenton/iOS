//
//  MADViewController.m
//  musicDependent
//
//  Created by Rob Denton on 10/8/13.
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
    NSBundle *bundle=[NSBundle mainBundle];
    // Returns bundle object
    NSString *plistPath=[bundle pathForResource:@"artistalbums" ofType:@"plist"];
    // Returns path to plist by name and extenstion
    _artistAlbums=[[NSDictionary alloc] initWithContentsOfFile:plistPath];
    // Loads contents of plist
    _artists=[_artistAlbums allKeys];
    // Retrieves artists
    NSString *selectedArtist=[_artists objectAtIndex:0];
    //Gets artist at index 0
    _albums=[_artistAlbums objectForKey:selectedArtist];
    //Gets albums for selected artist
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component==artistComponent) {
        return [_artists count];
    }
    else {
        return [_albums count];
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component==artistComponent) {
        return [_artists objectAtIndex:row];
    }
    else {
        return [_albums objectAtIndex:row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component==artistComponent) {
        NSString *selectedArtist=[_artists objectAtIndex:row];
        _albums=[_artistAlbums objectForKey:selectedArtist];
        [_musicPicker selectRow:0 inComponent:albumComponent animated:YES];
        [_musicPicker reloadComponent:albumComponent];
    }
    NSInteger artistrow=[_musicPicker selectedRowInComponent:artistComponent];
    NSInteger albumrow=[_musicPicker selectedRowInComponent:albumComponent];
    _choiceLabel.text=[NSString stringWithFormat:@"You like %@ by %@", [_albums objectAtIndex:albumrow],[_artists objectAtIndex:artistrow]];
    
}

@end
