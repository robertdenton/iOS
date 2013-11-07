//
//  MADSecondViewController.h
//  project2
//
//  Created by Rob Denton on 11/7/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//
//  Logo from theNounProject.com
//  Letter designed by Jayme Davis from The Noun Project

#import <UIKit/UIKit.h> 

@interface MADSecondViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *imageContainer;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) NSArray *items;

@end
