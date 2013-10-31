//
//  MADMasterViewController.m
//  harrypotter
//
//  Created by Rob Denton on 10/31/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADMasterViewController.h"

#import "MADDetailViewController.h"

@interface MADMasterViewController () /*{
    NSMutableArray *_objects;
}*/
@end

@implementation MADMasterViewController

//Used at startup, it says to keep something selected in the detail row & defines size of popover
- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*self.navigationItem.leftBarButtonItem = self.editButtonItem; //Edit button

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];//Add button
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (MADDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];*/
    NSBundle *bundle=[NSBundle mainBundle];//returns a bundle object of our app
    NSString *plistPath=[bundle pathForResource:@"harrypotter" ofType:@"plist"];
    NSDictionary *characterInfo=[NSDictionary dictionaryWithContentsOfFile:plistPath];
    self.characters=[characterInfo objectForKey:@"characters"];
    self.detailViewController=(MADDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}*/

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_characters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDictionary *characterChoosen=[_characters objectAtIndex:indexPath.row];
    cell.textLabel.text=[characterChoosen objectForKey:@"name"];
/*  NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];*/
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *characterChoosen = [self.characters objectAtIndex:indexPath.row];
    NSString *url=[characterChoosen objectForKey:@"url"];
    NSString *name=[characterChoosen objectForKey:@"name"];
    self.detailViewController.title=name;
    self.detailViewController.detailItem=url;
/*  NSDate *object = _objects[indexPath.row];
    self.detailViewController.detailItem = object;*/
}

@end
