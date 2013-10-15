//
//  MADViewController.m
//  favorites
//
//  Created by Rob Denton on 10/10/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADViewController.h"
#import "Favorite.h"
#import "Scene2ViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _user=[[Favorite alloc]init];
    _user.favBook=[NSString stringWithFormat:@" "];
    _user.favAuthor=[NSString stringWithFormat:@" "];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    //_bookLabel.text=_user.favBook;
    //_authorLabel.text=_user.favAuthor;
    
    _bookLabel.text=[NSString stringWithFormat:@"Your favorite book is: %@", _user.favBook];
    _authorLabel.text=[NSString stringWithFormat:@"Your favorite book is: %@", _user.favAuthor];
    
    //_bookLabel.text=[NSString stringWithFormat:@"Your favorite book is: "];
    //_authorLabel.text=[NSString stringWithFormat:@"Your favorite book is: "];
}

-(IBAction)returned :(UIStoryboardSegue *)segue {
    //_bookLabel.text=_user.favBook;
    //_authorLabel.text=_user.favAuthor;
    

    
    _bookLabel.text=[NSString stringWithFormat:@"Your favorite book is: %@", _user.favBook];
    _authorLabel.text=[NSString stringWithFormat:@"Your favorite book is: %@", _user.favAuthor];
    
}



@end
