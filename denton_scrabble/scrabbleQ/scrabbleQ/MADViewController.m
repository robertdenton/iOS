//
//  MADViewController.m
//  scrabbleQ
//
//  Created by Rob Denton on 10/22/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController
{
    NSArray *words; //Don't need it globally, so no need in H; don't need getters and setters; ONLY available in M file; no need for _ before because it's not calling something from H
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle=[NSBundle mainBundle];//returns bundle object for app //NSBundle is whole app, it's the sandbox/box we're playing in
    NSString *plistPath=[bundle pathForResource:@"qwordswithoutu1" ofType:@"plist"];//return the path of the plisht //Then 
    words=[[NSArray alloc] initWithContentsOfFile:plistPath]; //loads plist into array
    self.title=@"Words"; //sets the title of this controller (MADViewController) AKA: this displays the title of the controller at the top of the app to Words.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Required methods for UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{//sets the number of cells, required
    return [words count]; //returns the number of words in array
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{//displays table view cells//NSIndexPath is path to node of tree
    
    //vvv - This part never changes
    
    static NSString *cellIdentifier = @"cellIdentifier";//static variables are allocated for lifetime of program
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];//returns cell with identifier if it's in the queue already to be reused
    if (cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    //^^^ - Never changes
    
    //configure the cell
    cell.textLabel.text=[words objectAtIndex:indexPath.row];//sets the text of the cell with the row being used
    cell.detailTextLabel.text=@"Q no U"; // this can pull data from the plist for the subtitle
    return cell;
}

//UITableViewDelegate method that is called when a row is selected
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *rowValue=[words objectAtIndex:indexPath.row];//sets title
    NSString *message=[[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Row selected" message:message delegate:nil cancelButtonTitle:@"Yes I did" otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//deselects row
}



@end
