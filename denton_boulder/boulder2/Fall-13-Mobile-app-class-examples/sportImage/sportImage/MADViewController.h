//
//  MADViewController.h
//  sportImage
//
//  Created by Aileen Pierce on 9/5/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *SportImage;
- (IBAction)buttonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
- (IBAction)textFieldDoneEditing:(UITextField *)sender;

@end
