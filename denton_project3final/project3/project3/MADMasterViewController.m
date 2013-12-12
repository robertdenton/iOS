//
//  MADMasterViewController.m
//  project3
//
//  Created by Rob Denton on 12/10/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//
//  With lots of help from http://www.appcoda.com/ios-programming-rss-reader-tutorial/
//

#import "MADMasterViewController.h"
#import "MADDetailViewController.h"

@interface MADMasterViewController () {
    NSXMLParser *parser;
    NSMutableArray *feeds;
    NSMutableDictionary *item;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
}
@end

@implementation MADMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    feeds = [[NSMutableArray alloc] init];//alloc-inits array to populate the array
    NSURL *url = [NSURL URLWithString:@"http://cuindependent.com/author/robert-denton/feed"];//stories I've authored on the CUI
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];//alloc-inits the parser
    
    [parser setDelegate:self];//sets the delegate
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;//just need one section, keeping it simple
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return feeds.count;//count how many items in the array
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [[feeds objectAtIndex:indexPath.row] objectForKey: @"title"];
    return cell;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {//called when it finds a new element
    element = elementName;
    if ([element isEqualToString:@"item"]) {//on new element
        item    = [[NSMutableDictionary alloc] init];
        title   = [[NSMutableString alloc] init];
        link    = [[NSMutableString alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {//when your done creating the element
    if ([elementName isEqualToString:@"item"]) {//if it's new
        [item setObject:title forKey:@"title"];//set the title
        [item setObject:link forKey:@"link"];//set the link
        [feeds addObject:[item copy]];//add object to the array via copy
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [link appendString:string];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    [self.tableView reloadData];//when it finds no more new elements, reload the table
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {//when a cell is clicked
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];//grab the index of the array
        NSString *string = [feeds[indexPath.row] objectForKey: @"link"];//grab the URL
        [[segue destinationViewController] setUrl:string];//set the URL
    }
}

@end
