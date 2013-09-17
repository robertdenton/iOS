//
//  MADViewController.h
//  beatles
//
//  Created by Rob Denton on 9/17/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *beatlesImage;
@property (weak, nonatomic) IBOutlet UILabel *beatlesLabel;
@property (weak, nonatomic) IBOutlet UILabel *fontSizeLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *imageControl;
@property (weak, nonatomic) IBOutlet UISwitch *capitalizedSwitch;

- (IBAction)changeImage:(UISegmentedControl *)sender;
- (IBAction)updateFont:(UISwitch *)sender;
- (IBAction)changeFont:(UISlider *)sender;

@end
