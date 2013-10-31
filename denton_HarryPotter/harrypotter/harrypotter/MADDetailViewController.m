//
//  MADDetailViewController.m
//  harrypotter
//
//  Created by Rob Denton on 10/31/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADDetailViewController.h"

@interface MADDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController; //create popover
- (void)configureView; //create configureView method
@end

@implementation MADDetailViewController

#pragma mark - Managing the detail item

//Writing custom setter method because with @property you automatically get getters and setters
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    NSURL *url = [NSURL URLWithString:_detailItem]; //a NSURL object is initialized using the url in detailItem
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //constructs a NSURLRequest object from a NSURL object
    [self.webView loadRequest:request]; //loads a NSURLRequest object
    

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

//Handle rotation and giving us the putton
- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Characters", @"Characters");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

//back to landscape
- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
