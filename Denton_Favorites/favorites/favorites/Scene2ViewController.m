//
//  Scene2ViewController.m
//  favorites
//
//  Created by Rob Denton on 10/10/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "Scene2ViewController.h"
#import "Favorite.h"
#import "MADViewController.h"

@interface Scene2ViewController ()

@end

@implementation Scene2ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"doneFavs"]){
        _userInfo.favBook=_userBook.text;
        _userInfo.favAuthor=_userAuthor.text;
        //create object for our destination View Controller so we can send teh data back
        MADViewController *scene1ViewController=[segue destinationViewController];
        scene1ViewController.user.favBook=_userInfo.favBook;
        scene1ViewController.user.favAuthor=_userInfo.favAuthor;
        //need to see .h to put in user
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _userInfo=[[Favorite alloc]init];
    _userBook.delegate=self;
    _userAuthor.delegate=self;
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

@end
