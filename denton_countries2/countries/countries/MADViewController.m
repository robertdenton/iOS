//
//  MADViewController.m
//  countries
//
//  Created by Rob Denton on 10/24/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADViewController.h"
#import "DetailViewController.h"
#import "ContinentInfoViewController.h"

@interface MADViewController ()
{
    NSMutableDictionary *continentData;
}

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle=[NSBundle mainBundle]; //returns a bundle object of our app
    NSString *plistPath=[bundle pathForResource:@"continents" ofType:@"plist"]; //retrieves plist path
    NSMutableDictionary *dictionary=[[NSMutableDictionary alloc]initWithContentsOfFile:plistPath]; //Loads the contents of the plist file into a dicitionary
    //The dictionsary uses the continents as the keys andd an NSArray with the countries for teach continent
    continentData=dictionary;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [continentData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier=@"Cell";
    UITableViewCell *Cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(Cell==nil){
        Cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSArray *rowData=[continentData allKeys]; //Creates an array with all keys from dictionary
    Cell.textLabel.text=[rowData objectAtIndex:indexPath.row]; //Sets all the text of the cell with the row being requested
    return Cell;
}

/*
 //Mine
 -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"countrysegue"]){
        DetailViewController *countryViewController=segue.destinationViewController;
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        NSArray *rowData=[continentData allKeys];//Creates an array with all keys form dictionary
        countryViewController.title=[rowData objectAtIndex:indexPath.row];
        countryViewController.countryList=[continentData objectForKey:countryViewController.title];
    }
}*/

//Your's
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"countrysegue"]) {
        DetailViewController *countryViewController=segue.destinationViewController;
        
        NSIndexPath *indexPath=[self.tableView indexPathForCell:sender];
        NSArray *rowData=[continentData allKeys]; //creates an array with all keys from our dictionary
        countryViewController.title=[rowData objectAtIndex:indexPath.row];
        countryViewController.countryList=[continentData objectForKey:countryViewController.title];
    }
    if ([segue.identifier isEqualToString:@"continentsegue"]) {
        ContinentInfoViewController *infoViewController=segue.destinationViewController;
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        NSArray *rowData=[continentData allKeys];
        infoViewController.name=[rowData objectAtIndex:indexPath.row];
        infoViewController.number=[NSString stringWithFormat:@"%d", [[continentData objectForKey:infoViewController.name] count]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
