//
//  MADSecondViewController.h
//  boulder2
//
//  Created by Rob Denton on 10/17/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADSecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextView *questionTextView;
- (IBAction)submitQuestion:(id)sender;

@end
