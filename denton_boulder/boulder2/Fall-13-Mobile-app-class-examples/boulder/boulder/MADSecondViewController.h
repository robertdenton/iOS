//
//  MADSecondViewController.h
//  boulder
//
//  Created by Aileen Pierce on 10/12/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADSecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *emailTextfield;
@property (weak, nonatomic) IBOutlet UITextView *questionTextview;
- (IBAction)submitQuestion:(UIButton *)sender;

@end
